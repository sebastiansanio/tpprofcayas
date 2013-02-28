package stakeholder

import modal.Country
import report.Report
import login.User

class Stakeholder {

	Date	dateCreated
	Date	lastUpdated
	
	String name
	Country country
	String telephone
	String email
	Report defaultReport
	String defaultLocale
	

	static constraints = {
		name blank:false
		nullable:true
		telephone blank:true, nullable:true
		email email:true, blank:true, nullable:true
		defaultReport nullable: true
		defaultLocale nullable: true
    }
	
	public String toString() {
		return name
	}
}
