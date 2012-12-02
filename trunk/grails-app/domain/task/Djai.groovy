package task
import wish.*


class Djai extends Task {

	Date	dateCreated
	Date	lastUpdated
	
	String presented
	
	static belongsTo	= [wish:Wish,djaiStatus:DjaiStatus]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
