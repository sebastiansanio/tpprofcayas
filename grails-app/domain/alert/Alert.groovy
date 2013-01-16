package alert
import wish.Wish

class Alert {

	AlertType alertType		
	Date dateCreated
	Date deadline
	Date dateFinalized
	
	static belongsTo	= [wish:Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		alertType nullable:false
		wish nullable:false
		deadline nullable:false
		dateFinalized nullable:true
    }
	
	void finalize(){
		Date today = new Date()
		dateFinalized = today.clearTime() 
	}
	
	boolean isActive(){
		return (dateFinalized == null)
	}
	
	public String toString() {
		return alertType.toString()
	}
	
	
	
}
