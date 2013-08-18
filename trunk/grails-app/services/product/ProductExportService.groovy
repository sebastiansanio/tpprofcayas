package product

import java.io.OutputStream;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;


class ProductExportService implements MessageSourceAware{

    static transactional = true
	def exportService
	MessageSource messageSource

	def getMaxWidth(List products,String fieldName,int initialMaxWidth){
		int maxWidth = initialMaxWidth
		for(product in products){
			if(product[fieldName].toString().length()>maxWidth){
				maxWidth = product[fieldName].toString().length()
			}
		}
		return maxWidth * 1.2
	}
	
	def exportProducts(String format,OutputStream outputStream,Locale locale) {	
		List products = Product.list(sort:'id')
		List fields = ['id','descriptionEN']
		
		doExport(format,outputStream,locale,fields,products)
	}
	
	def doExport(String format,OutputStream outputStream,Locale locale,List fields,List products){
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}
		def booleanFormatter = {domain, value->
			return value?messageSource.getMessage("default.boolean.true",null,locale):messageSource.getMessage("default.boolean.false",null,locale)
		}
		Map labels = new HashMap()
		Map formatters = new HashMap()
		def productDomainClass = new Product().domainClass
		
		List widths = new ArrayList()
				
		for(field in fields){
			String label = messageSource.getMessage("product."+field+".label",null,field,locale)
			labels.put(field, label)
			if(productDomainClass.getPropertyByName(field).type == Date)
				formatters.put(field, dateFormatter)
			if(productDomainClass.getPropertyByName(field).type == boolean)
				formatters.put(field, booleanFormatter)
			widths.add(getMaxWidth(products,field,label.length()))
		}
		Map parameters = [title: messageSource.getMessage("product.label",null,locale),'column.widths':widths]
		exportService.export(format,outputStream,products,fields,labels,formatters,parameters)
	}
}
