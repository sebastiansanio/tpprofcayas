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
			
			configuration.stakeholder.contacts.each{
				if(it.sendReports)
					mails.add(it.email)		
			}
			
			if(mails.size()>0){
				ByteOutputStream outputStream = new ByteOutputStream()
				int quantity = wishExportService.exportWishByStakeholder('excel',outputStream,configuration.stakeholder.defaultLocale.locale,configuration.stakeholder,configuration.report)		
				if(quantity > 0){
					if(configuration.body.contains("[signature]")){
						mailService.sendMail {
							multipart true
							to mails.toArray()
							subject transformText(configuration.subject)
							html '<p style="font-family:Arial,Tahoma,sans-serif;font-size: 12px;">'+transformText(configuration.body).replace("\n", "<br/>").replace("[signature]","<img src='cid:signature' />")+'</p>'
							text transformText(configuration.body)
							attachBytes messageSource.getMessage("wish.reportByStakeholder.label",[configuration.stakeholder.toString(),DATE_FORMAT.format(new Date())].toArray(),configuration.stakeholder.defaultLocale.locale)+".xls",'application/vnd.ms-excel',outputStream.bytes
							inline 'signature','image/png',grailsApplication.mainContext.getResource('/images/logo2.png').file
						}
					}else{
						mailService.sendMail {
							multipart true
							to mails.toArray()
							subject transformText(configuration.subject)
							html '<p style="font-family:Arial,Tahoma,sans-serif;font-size: 12px;">'+transformText(configuration.body).replace("\n", "<br/>")+'</p>'
							text transformText(configuration.body)
							attachBytes messageSource.getMessage("wish.reportByStakeholder.label",[configuration.stakeholder.toString(),DATE_FORMAT.format(new Date())].toArray(),configuration.stakeholder.defaultLocale.locale)+".xls",'application/vnd.ms-excel',outputStream.bytes
						}
					}
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
