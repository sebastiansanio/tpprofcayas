package alert

class AlertType {

	String description
	Long term
	String nameOfEstimatedDateField
	String nameOfCompletionField
	
	static hasMany		= [alerts:Alert]	
	
    static mapping = {
    }
    
	static constraints = {
		description blank:false,nullable:false
		term nullable:false
		nameOfEstimatedDateField blank:false,nullable:false
		nameOfCompletionField blank:false,nullable:false
    }
	
	public String toString() {
		return description
	}
}
