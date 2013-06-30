package courier

import java.io.OutputStream;
import java.util.Date;
import java.util.Locale;

import org.springframework.context.MessageSource;

class CourierExportService {

    static transactional = true
	def exportService
	MessageSource messageSource
	
    def exportCourierRecord(String format,OutputStream outputStream,Locale locale,boolean pendingOnly) {
		
		List courierRecords = null
		
		if(pendingOnly){
			courierRecords = CourierRecord.findAllByArrivalDateIsNull([sort:"departureDate"])
		}else{
			courierRecords = CourierRecord.list([sort:"departureDate"])
		}				
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")	
		}
		def arrivedFormatter = {domain, value->
			return domain.delivered()?messageSource.getMessage("courierRecord.status.delivered.label",null,locale):messageSource.getMessage("courierRecord.status.traveling.label",null,locale)
		}
		def booleanFormatter = {domain, value->
			return value?messageSource.getMessage("default.boolean.true",null,locale):messageSource.getMessage("default.boolean.false",null,locale)
		}
		def costsInChargeOfFormatter = {domain, value->
			if(value == null)
				return null
			else{
				return messageSource.getMessage("courierRecord.costsInChargeOf."+value,null,locale)
			}	
		}
		
		List fields = ["courier","courier.web","trackingNumber","issuer","description",
			"requiresVisa","source","status","receivers","destination","departureDate",
			"estimatedArrivalDate","arrivalDate","costsInChargeOf","aditionalCosts","observations"]
		
		Map labels = ["courier":messageSource.getMessage("courierRecord.courier.label",null,locale),
			"courier.web":messageSource.getMessage("courier.web.label",null,locale),
			"trackingNumber":messageSource.getMessage("courierRecord.trackingNumber.label",null,locale),
			"issuer":messageSource.getMessage("courierRecord.issuer.label",null,locale),
			"description":messageSource.getMessage("courierRecord.description.label",null,locale),
			"requiresVisa":messageSource.getMessage("courierRecord.requiresVisa.label",null,locale),
			"source":messageSource.getMessage("courierRecord.source.label",null,locale),
			"status":messageSource.getMessage("courierRecord.status.label",null,locale),
			"receivers":messageSource.getMessage("courierRecord.receivers.label",null,locale),
			"destination":messageSource.getMessage("courierRecord.destination.label",null,locale),
			"departureDate":messageSource.getMessage("courierRecord.departureDate.label",null,locale),
			"estimatedArrivalDate":messageSource.getMessage("courierRecord.estimatedArrivalDate.label",null,locale),
			"arrivalDate":messageSource.getMessage("courierRecord.arrivalDate.label",null,locale),
			"costsInChargeOf":messageSource.getMessage("courierRecord.costsInChargeOf.label",null,locale),
			"aditionalCosts":messageSource.getMessage("courierRecord.aditionalCosts.label",null,locale),
			"observations":messageSource.getMessage("courierRecord.observations.label",null,locale)]
		Map formatters = ["departureDate":dateFormatter,"estimatedArrivalDate":dateFormatter,
			"arrivalDate":dateFormatter,"status":arrivedFormatter,"requiresVisa":booleanFormatter,
			"costsInChargeOf":costsInChargeOfFormatter]		
		Map parameters = [title: messageSource.getMessage("courierRecord.label",null,locale)]
		exportService.export(format,outputStream,courierRecords,fields,labels,formatters,parameters)			
    }
	
}
