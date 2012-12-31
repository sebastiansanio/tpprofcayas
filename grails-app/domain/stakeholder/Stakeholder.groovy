package stakeholder

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	
	static belongsTo	= StakeholderRole
	static hasMany		= [contacts:Contact,stakeholderRoles:StakeholderRole]	
	
    static mapping = {
		name blank:false
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
