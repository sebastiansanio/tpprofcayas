package wish

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;

import report.ReportSendConfiguration
import stakeholder.Stakeholder

class WishMailService  implements MessageSourceAware{

    static transactional = true
	static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
		
	def mailService
	def wishExportService
	def alertExportService
	MessageSource messageSource
	def grailsApplication
	
	def sendReports(){
		Date now = new Date()
		List sendConfigurations = ReportSendConfiguration.findAllByActive(true)		
		sendConfigurations.each{
			if(it.nextSendDateTime.compareTo(now)<=0){
				sendReport(it)					
			}
		}
	}
	
	String transformText(String text){
		String returnText
		returnText = text.replace("[week]",new Date().toCalendar().getAt(Calendar.WEEK_OF_YEAR).toString() )
		
		return returnText
	}

	def sendReport(ReportSendConfiguration configuration){
		
		try{
			
			List mails = new ArrayList()
			mails.addAll(configuration.contacts*.email)
			mails.removeAll(Collections.singleton(null))
			if(mails.size()>0){
				ByteOutputStream outputStream = new ByteOutputStream()
				ByteOutputStream outputStreamAlerts = new ByteOutputStream()
				
				int quantity = wishExportService.exportWishByStakeholder('excel',outputStream,configuration.stakeholder.defaultLocale.locale,configuration.stakeholder,configuration.report)		
				int alertsQuantity = 0
				if(configuration.sendAlerts)
					alertsQuantity = alertExportService.exportAlertsByStakeholder('excel',outputStreamAlerts, configuration.stakeholder,configuration.stakeholder.defaultLocale.locale)
				
				if(quantity > 0 && (configuration.sendReport || alertsQuantity>0)){
					
					boolean hasSignature = configuration.body.contains("[signature]")

					mailService.sendMail {
						multipart true
						to mails.toArray()
						subject transformText(configuration.subject)
						html transformText(configuration.body).replace("[signature]","<img src='cid:signature' />")
						if(configuration.sendReport)
							attach(messageSource.getMessage("wish.reportByStakeholder.label",[configuration.stakeholder.toString(),DATE_FORMAT.format(new Date())].toArray(),configuration.stakeholder.defaultLocale.locale)+".xls",'application/vnd.ms-excel',outputStream.bytes)
						if(alertsQuantity>0)
							attach(messageSource.getMessage("wish.alertsByStakeholder.label",[configuration.stakeholder.toString(),DATE_FORMAT.format(new Date())].toArray(),configuration.stakeholder.defaultLocale.locale)+".xls",'application/vnd.ms-excel',outputStreamAlerts.bytes)
						if(hasSignature) 
							inline('signature','image/jpeg',grailsApplication.mainContext.getResource('/images/logo3.jpg').file)
					}
					configuration.lastSentDate = new Date()
				}
				
				if(configuration.frequencyInDays == null){
					configuration.active = false
				}else{
					configuration.nextSendDate = configuration.nextSendDate.plus(configuration.frequencyInDays)
				}
			}
		}catch(Exception e){
			log.error("Error en envío de reporte",e)
		}
	}
}
