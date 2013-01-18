package alert
import wish.Wish

class Alert {

	AlertType alertType		
	Date dateCreated
	Date deadline
	Date dateFinalized
	String finalizedReason
	boolean checked
	
	static belongsTo	= [wish:Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		alertType nullable:false
		wish nullable:false
		deadline nullable:false
		dateFinalized nullable:true
		finalizedReason nullable:true,inList: ["Actividad realizada","Cambio de fecha"]
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
		}
	}
	
	boolean isActive(){
		return (dateFinalized == null)
	}
	
	public String toString() {
		return alertType.toString()
	}
	
	
	
}
