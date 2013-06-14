package alert

import wish.Wish
import org.hibernate.envers.Audited

@Audited
class AlertType {

	String description
	int alertTerm
	Integer frequency
	String nameOfEstimatedDateField
	String nameOfCompletionField
	
	static hasMany		= [alerts:Alert,stakeholders:String,messages:AlertMessage]
	
    static mapping = {
    }
    
	static constraints = {
		description blank:false,nullable:false
		nameOfEstimatedDateField blank:false,nullable:false
		nameOfCompletionField blank:false,nullable:false
		alertTerm nullable:false
		frequency nullable:true
    }
		
	public String toString() {
		return description
	}
	
	
}
