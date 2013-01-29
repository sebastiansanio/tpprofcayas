package stakeholder

import modal.Country;

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	Country country
	
	List contacts
	static hasMany	= [contacts:Contact]	

	static constraints = {
		name blank:false
    }
	
	public String toString() {
		return name
	}
}
