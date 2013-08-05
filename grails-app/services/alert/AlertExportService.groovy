package alert

import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;
import stakeholder.Stakeholder


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
		
		Map parameters = [title: messageSource.getMessage("alerts.label",null,locale)]
		exportService.export(format,outputStream,alerts,fields,labels,formatters,parameters)
					
    }		
	
	def exportAlertsByStakeholderAndDate(String format,OutputStream outputStream,Stakeholder stakeholder,Locale locale,Date fromDate,Date toDate){
		def alerts = new ArrayList()
		def alertsQuantity = 0
		def alertTypes = AlertType.list().findAll{
			stakeholder?.type in it.stakeholders
		}
		def wishes = stakeholder?.wishes
		if(alertTypes.size()>0 && wishes.size()>0){
			alerts = Alert.findAllByDateFinalizedIsNullAndWishInListAndAlertTypeInList(wishes,alertTypes,[sort:"attentionDate"])	
		}		
		
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}

		List fields = ["alertType.externalMessage","attentionDate","deadline"]
		for (field in ["customer","supplier","supplierOrder","customerOpNumber","opNumber"]){
			if(stakeholder?.defaultReport?.fields?.contains(field))
				fields.add("wish."+field)
		}
		Map labels = ["alertType.externalMessage":messageSource.getMessage("alertType.label",null,locale),
			"attentionDate":messageSource.getMessage("alert.attentionDate.label",null,locale),
			"deadline":messageSource.getMessage("alert.deadline.label",null,locale),
			"wish.customer":messageSource.getMessage("wish.customer.label",null,locale),
			"wish.supplier":messageSource.getMessage("wish.supplier.label",null,locale),
			"wish.supplierOrder":messageSource.getMessage("wish.supplierOrder.label",null,locale),
			"wish.customerOpNumber":messageSource.getMessage("wish.customerOpNumber.label",null,locale),
			"wish.opNumber":messageSource.getMessage("wish.opNumber.label",null,locale)]
		Map formatters = ["attentionDate":dateFormatter,"deadline":dateFormatter]
		
		Map parameters = [title: messageSource.getMessage("alerts.label",null,locale)]
		exportService.export(format,outputStream,alerts,fields,labels,formatters,parameters)
		
	}

}
