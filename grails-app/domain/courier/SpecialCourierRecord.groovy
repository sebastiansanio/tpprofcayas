package courier

import stakeholder.Stakeholder
import org.hibernate.envers.Audited

@Audited
class SpecialCourierRecord extends CourierRecord {

	static hasMany = [receivers:Stakeholder]
	
	Stakeholder issuer
	
	String description
	boolean requiresVisa
	
	
    static mapping = {
    }
    
	static constraints = {
		description nullable:true,blank:true
		issuer nullable:true
    }
	

}
