package task
import wish.*

class DocumentsDelivery extends Task{

	static hasMany		= [documents: Document]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
//	public String toString() {
//		return "${name}";
//	}
}
