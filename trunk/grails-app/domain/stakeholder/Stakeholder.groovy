package stakeholder

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	
	static belongsTo	= StakeholderRole
	static hasMany		= [contacts:Contact,stakeholderRoles:StakeholderRole]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
    static mapping = {
		name blank:false
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
