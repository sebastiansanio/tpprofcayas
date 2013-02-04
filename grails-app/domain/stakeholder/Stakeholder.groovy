package stakeholder

import modal.Country
import login.User

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	Country country
	User user
	
	List contacts
	static hasMany	= [contacts:Contact]	

	static constraints = {
		name blank:false
		user nullable:true
    }
	
	public String toString() {
		return name
	}
}
