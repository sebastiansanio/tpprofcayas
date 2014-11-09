package alert

import modal.AvailableLocale
import org.hibernate.envers.Audited

@Audited
class AlertMessage {

	Date	dateCreated
	Date	lastUpdated

	String subject
	String message
		
	static belongsTo	= [language: AvailableLocale, alertType: AlertType ]	

    
	static constraints = {
		subject blank:false,nullable:false
		message blank:false,nullable:false,maxSize: 1000
		language nullable:false,unique: 'alertType'
		alertType nullable:false
    }
	
	public String toString() {
		return alertType.toString() + " - "+ language.toString()
	}
}
