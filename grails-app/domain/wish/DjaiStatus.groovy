package wish

/**
 * DjaiStatus
 * A domain class describes the data object and it's mapping to the database
 */
class DjaiStatus {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	String status
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	static belongsTo	= Djai	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
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
