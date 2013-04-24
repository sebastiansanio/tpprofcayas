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
			'V': 'finishDate',
			'W': 'customsBrokerRefNumber',
			'X': 'dateOfMoneyInAdvanceTransfer',
			'Y': 'paymentTerm.id',
			'Z': 'wishStatus.id',
			'AA': 'paymentStatus.id',
			'AB': 'visaChargePayment',
			'AC': 'visaChargePaymentConcept.id',
			'AD': 'criterionValue.id',
			'AE': 'licenses',
			'AF': 'djaiExtendedRequested',
			'AG': 'djaiExtendedExpiration',
			'AH': 'shippingMark.id',
			'AI': 'customerLogoPunch',
			'AJ': 'taxRegistryNumberAndCuitVerification',
			'AK': 'hsCodeToBeWritten',
			'AL': 'amountOfMoneyInAdvanceTransferred',
			'AM': 'swiftReceivedDate',
			'AN': 'swiftSentToSupplierDate',
			'AO': 'moneyBalance',
			'AP': 'dateOfBalancePayment',
			'AQ': 'picturesOfPrintingBoxesAndLoadReceived',
			'AR': 'picturesOfLoadingContainerReceived',
			'AS': 'sourceCountry.id',
			'AT': 'port.id',
			'AU': 'docDraftApproved',
			'AV': 'freightQuote',
			'AW': 'forwarderRefNumber',
			'AX': 'loadSecuredPercent',
			'AY': 'cbm',
			'AZ': 'grossWeight',
			'BA': 'netWeight',
			'BB': 'palletsQuantity',
			'BC': 'typeOfFreight.id',
			'BD': 'blNumber',
			'BE': 'bill',
			'BF': 'billDate',
			'BG': 'hasFeeder'
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
				['shipper.id','priceCondition.id','currency.id','customsBroker.id','ship.id','forwarder.id','agent.id',
					'paymentTerm.id','wishStatus.id','paymentStatus.id','visaChargePayment','visaChargePaymentConcept.id','criterionValue.id','licenses',
					'shippingMark.id','customerLogoPunch','hsCodeToBeWritten','amountOfMoneyInAdvanceTransferred',
					'moneyBalance','sourceCountry.id','port.id','freightQuote','forwarderRefNumber','loadSecuredPercent',
					'cbm','grossWeight','netWeight','palletsQuantity','typeOfFreight.id','blNumber','bill','hasFeeder'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
				}
				
					
					
				['wishDate','estimatedTimeOfDeparture','estimatedTimeOfArrival','djaiFormalizationDate','finishDate',
					'dateOfMoneyInAdvanceTransfer','djaiExtendedRequested','djaiExtendedExpiration','taxRegistryNumberAndCuitVerification',
					'swiftReceivedDate','swiftSentToSupplierDate','dateOfBalancePayment','picturesOfPrintingBoxesAndLoadReceived',
					'picturesOfLoadingContainerReceived','docDraftApproved','billDate'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
					else if(it[attribute] == 'OK')
						it[attribute] = it['wishDate'].plus(20)
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
			System.out.println(e.getMessage())
			throw new RuntimeException("Importing failed",e)
		}finally{
			file.delete()
		}
    }
}
