package alert

import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;


class AlertExportService {

    static transactional = true
	def exportService
	MessageSource messageSource

    def exportAlert(String format,OutputStream outputStream,Locale locale,Date fromDate,Date toDate,boolean pendingOnly) {
		
		List alerts = Alert.findAllByAttentionDateGreaterThanEqualsAndAttentionDateLessThanEquals(fromDate,toDate,[sort:"attentionDate"])
		
		if(pendingOnly)
			alerts = alerts.findAll{
				it.isActive() && !it.isInspected()
			}
		
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")	
		}

		Date dateFinalized
		String finalizedReason
		
		Date lastInspected
		
		List fields = ["alertType","attentionDate","deadline","wish.customer","wish.supplier",
			"wish.supplierOrder","wish.opNumber","dateFinalized","finalizedReason","lastInspected"]
		
		
		Map labels = ["alertType":messageSource.getMessage("alert.alertType.label",null,locale),
			"attentionDate":messageSource.getMessage("alert.attentionDate.label",null,locale),
			"deadline":messageSource.getMessage("alert.deadline.label",null,locale),
			"wish.customer":messageSource.getMessage("wish.customer.label",null,locale),
			"wish.supplier":messageSource.getMessage("wish.supplier.label",null,locale),
			"wish.supplierOrder":messageSource.getMessage("wish.supplierOrder.label",null,locale),
			"dateFinalized":messageSource.getMessage("alert.dateFinalized.label",null,locale),
			"finalizedReason":messageSource.getMessage("alert.finalizedReason.label",null,locale),
			"lastInspected":messageSource.getMessage("alert.lastInspected.label",null,locale),
			"wish.opNumber":messageSource.getMessage("wish.opNumber.label",null,locale)]
		Map formatters = ["attentionDate":dateFormatter,"deadline":dateFormatter,
			"dateFinalized":dateFormatter,"lastInspected":dateFormatter]		
		
		

		Map parameters = [title: messageSource.getMessage("alert.label",null,locale)]
		exportService.export(format,outputStream,alerts,fields,labels,formatters,parameters)
		
				
    }
	
			
			
		
}
