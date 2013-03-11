package importer

import java.util.Map;
import org.grails.plugins.excelimport.*


class GenericExcelImporter extends AbstractExcelImporter  {

	
	def getExcelImportService(){
		ExcelImportService.getService()
	}
	
	public GenericExcelImporter(String filename){
		super(filename)
	}
	
	List<Map> getObjects(Map parameters){
		List objectsList = excelImportService.columns(workbook,parameters)
	}
}

