package alert
import wish.Wish

class Alert {

	AlertType alertType		
	Date dateCreated
	Date deadline
	Date dateFinalized
	String finalizedReason
	
	Date lastInspected
	
	static belongsTo	= [wish:Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		alertType nullable:false
		wish nullable:false
		deadline nullable:false
		dateFinalized nullable:true
		finalizedReason nullable:true,inList: ["Actividad realizada","Cambio de fecha"]
		lastInspected nullable:true
    }
	
	void finalize(String reason){
		Date today = new Date()
		dateFinalized = today
		finalizedReason = reason
	}
	
	void check(){
				
		if(wish[alertType.nameOfCompletionField]!=null){
			finalize("Actividad realizada")
		}else if(wish[alertType.nameOfEstimatedDateField] != deadline){
			finalize("Cambio de fecha")
		}else if(isInspected() && alertType.frequency!=null && new Date() >= lastInspected + alertType.frequency){
			lastInspected = null
		}
	}
	
	boolean isActive(){
		return (dateFinalized == null)
	}
	
	String toString() {
		return alertType.toString()
	}
	
	void inspected(){
		lastInspected = new Date().clearTime()
	}
	
	boolean isInspected(){
		return lastInspected!=null 
	}
		
	
}
