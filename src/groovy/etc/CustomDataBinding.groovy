package etc

import java.text.SimpleDateFormat
import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry
import org.springframework.beans.propertyeditors.CustomDateEditor
import org.springframework.beans.propertyeditors.CustomNumberEditor
import org.springframework.context.i18n.LocaleContextHolder
import org.codehaus.groovy.grails.web.binding.StructuredDateEditor
import java.text.NumberFormat

class CustomDataBinding implements PropertyEditorRegistrar{
	
	public void registerCustomEditors(PropertyEditorRegistry registry) {
			
			String dateFormat = 'dd/MM/yyyy'
			registry.registerCustomEditor(Date, new CustomDateEditor(new SimpleDateFormat(dateFormat), true))
			registry.registerCustomEditor(BigDecimal.class, new CustomNumberEditor(BigDecimal.class,NumberFormat.getNumberInstance(new Locale("en","us")),true))
			
	}
	
}
