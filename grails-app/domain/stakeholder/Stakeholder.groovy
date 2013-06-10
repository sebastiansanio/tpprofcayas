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
	String province
	String locality
	
	String 	telephone
	String 	email
	Report 	defaultReport
	AvailableLocale defaultLocale
	String notes
	
	String accountName
	String accountNumber
	String bankName
	String bankAddress
	String swiftCode
	String owner
	
	static constraints = {
		name blank:false, nullable:true
		telephone blank:true, nullable:true
		email email:true, blank:true, nullable:true
		defaultReport nullable: false
		defaultLocale nullable: false
		province nullable:true,blank:true
		locality nullable:true,blank:true
		notes blank:true,nullable:true
		accountName blank:true,nullable:true
		accountNumber blank:true,nullable:true
		bankName blank:true,nullable:true
		bankAddress blank:true,nullable:true
		swiftCode blank:true,nullable:true
		owner blank:true,nullable:true
    }
	
	public String toString() {
		return name
	}
}
