package alert

import wish.Wish

class AlertType {

	String description
	int alertTerm
	String nameOfEstimatedDateField
	String nameOfCompletionField
	
	static hasMany		= [alerts:Alert]	
	
    static mapping = {
    }
    
	static constraints = {
		description blank:false,nullable:false
		nameOfEstimatedDateField blank:false,nullable:false
		nameOfCompletionField blank:false,nullable:false
		alertTerm nullable:false
    }
	
	public void checkWish(Wish wish){
		Date completionField = wish.getDate(nameOfCompletionField)
		if (completionField != null)
			return
		Date estimatedDate = wish.getDate(nameOfEstimatedDateField)		
		if (estimatedDate == null)
			return
		Date today = new Date()
		today = today.clearTime()
			
		if(estimatedDate  <= today + alertTerm)
			wish.generateAlert(this,estimatedDate)
	}
	
	public String toString() {
		return description
	}
	
	
}
