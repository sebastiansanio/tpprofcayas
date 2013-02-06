package stakeholder

import modal.Country
import login.User

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	Country country
	String telephone
	String email
	

	static constraints = {
		name blank:false
		nullable:true
		telephone blank:true, nullable:true
		email email:true, blank:true, nullable:true
    }
	
	public String toString() {
		return name
	}
}
