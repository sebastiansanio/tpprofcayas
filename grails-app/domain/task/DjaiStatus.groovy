package task

/**
 * DjaiStatus
 * A domain class describes the data object and it's mapping to the database
 */
class DjaiStatus {

	String status
	
	static hasMany		= [djais: Djai]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return status;
	}
}
