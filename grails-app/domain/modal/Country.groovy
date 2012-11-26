package modal

/**
 * Country
 * A domain class describes the data object and it's mapping to the database
 */
class Country {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	String name
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [ports: Port]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
