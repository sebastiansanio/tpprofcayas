package stakeholder

import modal.AvailableLocale
import wish.Wish
import modal.Country
import report.Report
import login.User

class Stakeholder {
	
	static hasMany		= [contacts: Contact]
   
	List 	contacts
	
	Date	dateCreated
	Date	lastUpdated
	
	String 	name
	Country country
	String 	telephone
	String 	email
	Report 	defaultReport
	AvailableLocale defaultLocale
	

	static constraints = {
		name blank:false, nullable:true
		telephone blank:true, nullable:true
		email email:true, blank:true, nullable:true
		defaultReport nullable: false
		defaultLocale nullable: false
    }
	
	public String toString() {
		return name
	}
}
