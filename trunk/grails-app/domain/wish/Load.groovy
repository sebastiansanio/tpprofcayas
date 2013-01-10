package wish
import product.*

class Load {

	
	Date	dateCreated
	Date	lastUpdated
	String productsDescription
	
	static belongsTo	= [wish: Wish]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static hasMany		= [loadUnits: LoadUnit]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	

	public String toString() {
		return productsDescription
	}
}
