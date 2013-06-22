package courier

import stakeholder.Stakeholder

class SpecialCourierRecord extends CourierRecord {

	static hasMany = [receivers:Stakeholder]
	
	Stakeholder issuer
	
	String description
		
	
    static mapping = {
    }
    
	static constraints = {
		description nullable:true,blank:true
		issuer nullable:true
    }
	

}