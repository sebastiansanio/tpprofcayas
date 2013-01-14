package alert
import wish.Wish

class Alert {

	AlertType alertType		
	Date dateCreated
	Date dateFinalized
	
	static belongsTo	= [wish:Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		alertType nullable:false
		wish nullable:false
		dateFinalized nullable:true
    }
	
	public String toString() {
		return alertType.toString()
	}
}
