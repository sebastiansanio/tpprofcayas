package wish

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream
import java.io.OutputStream;
import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;

import stakeholder.Stakeholder

class WishMailService  implements MessageSourceAware{

    static transactional = true
	
	def mailService
	def wishExportService
	MessageSource messageSource
	
	def sendReports(){

	}

	def sendMail(Stakeholder stakeholder){
		
		ByteOutputStream outputStream = new ByteOutputStream()
		wishExportService.exportWishByStakeholder('excel',outputStream,stakeholder.defaultLocale.locale,stakeholder)
		
		mailService.sendMail {
			multipart true
			to stakeholder.email
			subject "Asunto"
			body "Contenido"
			attachBytes messageSource.getMessage("wish.label",null,stakeholder.defaultLocale.locale)+".xls",'application/vnd.ms-excel',outputStream.bytes
		}
	}
}
