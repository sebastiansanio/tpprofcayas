package wish

import java.io.OutputStream;
import java.util.Locale;

import stakeholder.Stakeholder

class WishesMailService {

    static transactional = true
	
	def mailService
	def wishExportService

	def sendMail(Stakeholder stakeholder){
		
		File file = new File("${message(code:'wish.label')}"+new Date()+".${params.extension}")
		OutputStream outputStream = new FileOutputStream(file)
		wishExportService.exportWishByStakeholder('excel',outputStream,stakeholder.defaultLocale.getLocale(),stakeholder)
		
		mailService.sendMail {
			multipart true
			to stakeholder.email
			subject "${message(code:'wish.label')}"
			body "${message(code:'wish.label')}"
			attachBytes "${message(code:'wish.label')}.${params.extension}",'application/vnd.ms-excel',file.readBytes()
		}
		file.delete()
		redirect(action: "list")
	}
}
