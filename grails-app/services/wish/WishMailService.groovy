package wish

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream
import java.io.OutputStream;
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;

import report.ReportSendConfiguration
import stakeholder.Stakeholder

class WishMailService  implements MessageSourceAware{

    static transactional = true
	
	def mailService
	def wishExportService
	MessageSource messageSource
	
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
			ByteOutputStream outputStream = new ByteOutputStream()
			wishExportService.exportWishByStakeholder('excel',outputStream,configuration.stakeholder.defaultLocale.locale,configuration.stakeholder,configuration.report)
			
			List mails = new ArrayList()
			
			configuration.stakeholder.contacts.each{
				if(it.sendReports)
					mails.add(it.email)		
			}
			
			if(mails.size()>0){
					
				mailService.sendMail {
					multipart true
					to mails.toArray()
					subject transformText(configuration.subject)
					body transformText(configuration.body)
					attachBytes messageSource.getMessage("wish.label",null,configuration.stakeholder.defaultLocale.locale)+".xls",'application/vnd.ms-excel',outputStream.bytes
				}
				configuration.lastSentDate = new Date()
				
				if(configuration.frequencyInDays == null){
					configuration.active = false
				}
				else{
					configuration.nextSendDate = configuration.nextSendDate.plus(configuration.frequencyInDays)
				}
			}
		}catch(Exception e){
			log.error("Error en envío de reporte",e)
		}
	}
}
