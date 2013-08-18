package product

import java.util.Map;

import importer.GenericExcelImporter
import stakeholder.*

class ProductImportService {

    static transactional = true

	Map configuration = [
		sheet:'Artículo',
		startRow:1,
		columnMap: [
			'A':'descriptionSP',
			'B':'descriptionEN',
			'C':'color.id',
			'D':'supplierCode',
			'E':'customerCode',
			'F':'status',
			'G':'unit.id',
			'H':'currency.id',
			'I':'priceCondition.id',
			'J':'pricePerUnit',
			'K':'port.id',
			'L':'consolidationArea.id',
			'M':'family.id',
			'N':'subFamily.id',
			'O':'attribute',
			'P':'typeOfPresentation.id',
			'Q':'supplier.id',
			'R':'shipper.id',
			'S':'country.id',
			'T':'criterionValue.id',
			'U':'hsCode',
			'V':'tax',
			'W':'quantityPerCarton',
			'X':'innerBoxQuantity',
			'Y':'articlesQuantityPerInnerBox',
			'Z':'netWeightPerBox',
			'AA':'grossWeightPerBox',
			'AB':'outerBoxLength',
			'AC':'outerBoxWidth',
			'AD':'outerBoxHeight',
			'AE':'innerBoxLength',
			'AF':'innerBoxWidth',
			'AG':'innerBoxHeight',
			'AH':'boxesPerPallets',
			'AI':'piecesPerPallet',
			'AJ':'notes'
		]
	]

    def importProducts(byte[] fileContent) {
		String filename = "import"+new Date().getTime().toString()+".tmp"
		File file = new File(filename)
		file.createNewFile()
		FileOutputStream fos = new FileOutputStream(file)
		fos.write(fileContent)
		fos.close()
		def path = file.getAbsolutePath()
		try{
			GenericExcelImporter genericExcelImporter = new GenericExcelImporter(path)
			List productsData = genericExcelImporter.getObjects(configuration)
						
			for(productData in productsData){
				for(field in ["attribute","customerCode","hsCode","notes","supplierCode"]){
					if(productData[field]==null)
						productData[field]=""
				}
				for(field in ["color.id","unit.id","currency.id","priceCondition.id","port.id",
					"consolidationArea.id","family.id","subFamily.id","typeOfPresentation.id",
					"supplier.id","shipper.id","country.id","criterionValue.id"]){
					if(productData[field]==null)
						productData.remove(field)
				}
				
				Product product = new Product(productData)
				product.save(failOnError:true)
					
				
			}
		}catch(Exception e){
			throw new RuntimeException(e.getMessage(),e)
		}finally{
			file.delete()
		}
    }
}
