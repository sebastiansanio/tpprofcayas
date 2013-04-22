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
			'D': 'trackingNumber',
			'E': 'phase'

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
				
				System.out.println(wish)			
				['opNumber','documentType.id','trackingNumber'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
				}
				['received'].each{attribute ->
					if(it[attribute] == null)
						it.remove(attribute)
					else
						it[attribute] = it[attribute].toDateTimeAtStartOfDay().toDate()
				}
				
				Document document = new Document(it)
				document.file = ""

				if(it['phase'] == 1){
					wish.addToFirstStageRequiredDocuments(document)
				}else if(it['phase'] == 2){
					wish.addToSecondStageRequiredDocuments(document)
				}else{
					throw new RuntimeException("Phase not valid")
				}
				wish.save(flush:true)
				
			}
		}catch(Exception e){
			e.printStackTrace()
		
			throw new RuntimeException("Importing failed",e)
		}finally{
			file.delete()
		}
    }
}
