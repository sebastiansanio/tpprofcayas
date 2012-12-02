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
	
//	public String toString() {
//		return "${name}";
//	}
}
