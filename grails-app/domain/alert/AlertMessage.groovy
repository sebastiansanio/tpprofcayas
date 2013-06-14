package alert

import modal.AvailableLocale
import org.hibernate.envers.Audited

@Audited
class AlertMessage {

	Date	dateCreated
	Date	lastUpdated

	String message
		
	static belongsTo	= [language: AvailableLocale, alertType: AlertType ]	

    
	static constraints = {
		message blank:false
		language nullable:false,unique: 'alertType'
		alertType nullable:false
    }
	
	public String toString() {
		return alertType.toString() + " - "+ language.toString()
	}
}
