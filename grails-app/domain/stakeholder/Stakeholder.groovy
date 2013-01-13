package stakeholder

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	
	static hasMany	= [contacts:Contact]	
	
    static mapping = {
		name blank:false
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
