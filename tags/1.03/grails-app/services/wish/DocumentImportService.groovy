package wish

import importer.GenericExcelImporter
import stakeholder.*

class DocumentImportService {

    static transactional = true
	
	
	Map configuration = [
		sheet:'Documento',
		startRow:1,
		columnMap: [
			'A': 'opNumber',
			'B': 'documentType.id',
			'C': 'received',
			'D': 'courierRecord.id',
			'E': 'phase',
			'F': 'deliveredToCustomsBrokerDate',
			'G': 'deliveredToLawyerDate',
			'H': 'deliveredToCustomerDate'

		]
	]

    def importDocuments(byte[] fileContent) {
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
				def wish = Wish.findByOpNumber(it['opNumber'])
				if(wish==null)
					throw new RuntimeException("Order with Op Number ${it['opNumber']} doesn't exist")
						
				['opNumber','documentType.id','trackingNumber','courierRecord.id'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
				}
				['received','deliveredToCustomsBrokerDate','deliveredToLawyerDate','deliveredToCustomerDate'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
					else
						it[attribute] = it[attribute].toDateTimeAtStartOfDay().toDate()
				}

				if(it['phase'] == 1){
					FirstStageDocument document = new FirstStageDocument(it)
					document.file = ""
					wish.addToFirstStageRequiredDocuments(document)
				}else if(it['phase'] == 2){
					SecondStageDocument document = new SecondStageDocument(it)
					document.file = ""
					wish.addToSecondStageRequiredDocuments(document)
				}else{
					throw new RuntimeException("Phase not valid")
				}
				
				wish.save(flush:true,failOnError:true)
				
			}
		}catch(Exception e){
			throw new RuntimeException(e.message,e)
		}finally{
			file.delete()
		}
    }
}
