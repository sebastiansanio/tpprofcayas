package alert

class AlertType {

	String description
	int alertTerm
	String nameOfEstimatedDateField
	int daysOfOffset
	String nameOfCompletionField
	
	static hasMany		= [alerts:Alert]	
	
    static mapping = {
    }
    
	static constraints = {
		description blank:false,nullable:false
		nameOfEstimatedDateField blank:false,nullable:false
		daysOfOffset nullable:false
		nameOfCompletionField blank:false,nullable:false
		alertTerm nullable:false
    }
	
	public String toString() {
		return description
	}
}
