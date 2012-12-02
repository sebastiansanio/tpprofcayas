package stakeholder

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [contacts:Contact]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
		name blank:false
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
