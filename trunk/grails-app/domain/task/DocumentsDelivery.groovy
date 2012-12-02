package task
import wish.*

class DocumentsDelivery extends Task{

//	Date	dateCreated
//	Date	lastUpdated
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [documents: Document]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
//	public String toString() {
//		return "${name}";
//	}
}
