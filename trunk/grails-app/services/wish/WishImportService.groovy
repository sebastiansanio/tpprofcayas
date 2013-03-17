package wish

import importer.GenericExcelImporter
import stakeholder.*

class WishImportService {

    static transactional = true
	def opNumberGeneratorService
	
	
	Map configuration = [
		sheet:'Pedido',
		startRow:1,
		columnMap: [
			'A': 'opNumber',
			'B': 'customerOpNumber',
			'C': 'customer.id',
			'D': 'supplier.id',
			'E': 'shipper.id',
			'F': 'productDescription',
			'G': 'supplierOrder',
			'H': 'priceCondition.id',
			'I': 'currencyFob',
			'J': 'currency.id',
			'K': 'conversion',
			'L': 'estimatedTimeOfDeparture',
			'M': 'estimatedTimeOfArrival',
			'N': 'wishDate',
			'O': 'customsBroker.id',
			'P': 'ship.id',
			'Q': 'forwarder.id',
			'R': 'agent.id',
			'S': 'dispatchNumber',
			'T': 'djaiNumber',
			'U': 'djaiFormalizationDate',
			'V': 'finishDate'
		]
	]

    def importWishes(byte[] fileContent) {
		String filename = "import"+new Date().getTime().toString()+".tmp"
		File file = new File(filename)
		file.createNewFile()
		FileOutputStream fos = new FileOutputStream(file)
		fos.write(fileContent)
		fos.close()
		def path = file.getAbsolutePath()
		try{
			GenericExcelImporter genericExcelImporter = new GenericExcelImporter(path)
			List objects = genericExcelImporter.getObjects(configuration)

			objects.each{
				def customer = Customer.get(it['customer.id'])								
				['shipper.id','priceCondition.id','currency.id','customsBroker.id','ship.id','forwarder.id','agent.id'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
				}
				['estimatedTimeOfDeparture','estimatedTimeOfArrival','wishDate','djaiFormalizationDate','finishDate'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
					else
						it[attribute] = it[attribute].toDateTimeAtStartOfDay().toDate()
				}
				Wish wishInstance = new Wish(it)
				if(wishInstance.customerOpNumber == null)
					wishInstance.customerOpNumber = opNumberGeneratorService.getNextCustomerOpNumber(customer)
				if(wishInstance.opNumber == null)
					wishInstance.opNumber = opNumberGeneratorService.getNextOpNumber()
				
				customer.addToWishes(wishInstance)
				customer.save()
			}
		}catch(Exception e){
			throw new RuntimeException("Importing failed")
		}finally{
			file.delete()
		}
    }
}
