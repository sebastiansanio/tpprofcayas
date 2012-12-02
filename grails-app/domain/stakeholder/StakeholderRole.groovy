package stakeholder

class StakeholderRole {


	String description
		
	static hasMany		= [stakeholders:Stakeholder]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return description;
	}
}
