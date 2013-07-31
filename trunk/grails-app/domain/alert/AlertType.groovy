package alert

import wish.Wish
import modal.AvailableLocale
import org.hibernate.envers.Audited

@Audited
class AlertType {

	String description
	int alertTerm
	Integer frequency
	String nameOfEstimatedDateField
	String nameOfCompletionField
	String externalMessage
	
	static hasMany		= [alerts:Alert,stakeholders:String,messages:AlertMessage]
	
    static mapping = {
    }
	
	AlertMessage retrieveMessage(AvailableLocale locale){
		AlertMessage returnMessage = null
		returnMessage = messages.find {
			it.language == locale 
		}
		return returnMessage
	}
    
	static constraints = {
		description blank:false,nullable:false
		nameOfEstimatedDateField blank:false,nullable:false
		nameOfCompletionField blank:false,nullable:false
		alertTerm nullable:false
		frequency nullable:true
		externalMessage nullable:true
    }
		
	public String toString() {
		return description
	}
	
	
}
