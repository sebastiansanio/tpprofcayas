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

	Map fieldsByStakeholder = ["customsBroker":["alertType.externalMessage","attentionDate","deadline",
		"wish.customsBrokerRefNumber","wish.supplierOrder","wish.customer","wish.djaiNumber","wish.djaiFormalizationDate",
		"wish.djaiExpirationDate","wish.djaiExtendedExpiration"],
		"forwarder":["alertType.externalMessage","wish.forwarderRefNumber","attentionDate","deadline","wish.customer",
			"wish.supplierOrder"],
		"supplier":["alertType.externalMessage","attentionDate","deadline","wish.customer","wish.shipper",
			"wish.supplierOrder","wish.opNumber"],
		"customer":["alertType.externalMessage","attentionDate","deadline","wish.customer","wish.shipper",
			"wish.supplierOrder","wish.customerOpNumber"]
		
		]

	
	def getMaxWidth(List alerts,String fieldName,int initialMaxWidth){

		int maxWidth = initialMaxWidth
		if(fieldName.contains(".")){
			String baseField = fieldName.substring(0,fieldName.indexOf("."))
			String endField = fieldName.substring(fieldName.indexOf(".")+1)
			for (alert in alerts){
				if(alert[baseField][endField].toString().length()>maxWidth){
					maxWidth = alert[baseField][endField].toString().length()
				}
			}
		}else{	
			for (alert in alerts){
				if(alert[fieldName].toString().length()>maxWidth){
					maxWidth = alert[fieldName].toString().length()
				}
			}
		}
		return maxWidth * 1.3
	}
	
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
		List widths = new ArrayList()
		for (field in fields){
			widths.add(getMaxWidth(alerts,field,labels[field].length()))
		}
		Map parameters = [title: messageSource.getMessage("alerts.label",null,locale),'column.widths':widths]
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
			alerts = Alert.findAllByAttentionDateGreaterThanEqualsAndAttentionDateLessThanEqualsAndDateFinalizedIsNullAndWishInListAndAlertTypeInList(fromDate,toDate,wishes,alertTypes,[sort:"attentionDate"])	
			alertsQuantity = alerts.size()
		}		
		doExportStakeholder(alerts,format,outputStream,stakeholder,locale)
		return alertsQuantity
	}
	

	
	def exportAlertsByStakeholder(String format,OutputStream outputStream,Stakeholder stakeholder,Locale locale){
		def alerts = new ArrayList()
		def alertsQuantity = 0
		def alertTypes = AlertType.list().findAll{
			stakeholder?.type in it.stakeholders
		}
		def wishes = stakeholder?.wishes
		if(alertTypes.size()>0 && wishes.size()>0){
			alerts = Alert.findAllByDateFinalizedIsNullAndWishInListAndAlertTypeInList(wishes,alertTypes,[sort:"attentionDate"])
			alertsQuantity = alerts.size()
		}	
		doExportStakeholder(alerts,format,outputStream,stakeholder,locale)
		return alertsQuantity
	}
	
	def doExportStakeholder(List alerts,String format,OutputStream outputStream,Stakeholder stakeholder,Locale locale){
		
		
		Map labels = ["alertType.externalMessage":messageSource.getMessage("alertType.label",null,locale),
			"attentionDate":messageSource.getMessage("alert.attentionDate.label",null,locale),
			"deadline":messageSource.getMessage("alert.deadline.label",null,locale),
			"wish.customsBrokerRefNumber":messageSource.getMessage("wish.customsBrokerRefNumber.label",null,locale),
			"wish.supplierOrder":messageSource.getMessage("wish.supplierOrder.label",null,locale),
			"wish.customer":messageSource.getMessage("wish.customer.label",null,locale),
			"wish.djaiNumber":messageSource.getMessage("wish.djaiNumber.label",null,locale),
			"wish.djaiFormalizationDate":messageSource.getMessage("wish.djaiFormalizationDate.label",null,locale),
			"wish.djaiExpirationDate":messageSource.getMessage("wish.djaiExpirationDate.label",null,locale),
			"wish.djaiExtendedExpiration":messageSource.getMessage("wish.djaiExtendedExpiration.label",null,locale),
			"wish.forwarderRefNumber":messageSource.getMessage("wish.forwarderRefNumber.label",null,locale),
			"wish.shipper":messageSource.getMessage("wish.shipper.label",null,locale),
			"wish.supplier":messageSource.getMessage("wish.supplier.label",null,locale),
			"wish.customerOpNumber":messageSource.getMessage("wish.customerOpNumber.label",null,locale),
			"wish.opNumber":messageSource.getMessage("wish.opNumber.label",null,locale)]
		
		List fields = fieldsByStakeholder[stakeholder.type]?:["alertType.externalMessage","attentionDate","deadline"]
		
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}
		Map formatters = ["attentionDate":dateFormatter,"deadline":dateFormatter,
			"wish.djaiFormalizationDate":dateFormatter,"wish.djaiExpirationDate":dateFormatter,
			"wish.djaiExtendedExpiration":dateFormatter]
		List widths = new ArrayList()
		for (field in fields){
			widths.add(getMaxWidth(alerts,field,labels[field].length()))
		}
		Map parameters = [title: messageSource.getMessage("alerts.label",null,locale),'column.widths':widths]
		exportService.export(format,outputStream,alerts,fields,labels,formatters,parameters)
		
	}

}
