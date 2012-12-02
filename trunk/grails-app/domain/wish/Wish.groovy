package wish

import stakeholder.*
import task.PaymentTerm;


class Wish {

	Date dateCreated
	Date lastUpdated
	Date wishDate
	String supplierOrder
	Long opNumber
	Stakeholder customer
	Stakeholder supplier
	Stakeholder shipper
	String note
	
		
	static hasOne		= [load:Load]	
	static hasMany		= [tasks:Task]	
	
    static mapping = {
    }
    
	static constraints = {
    	customer nullable:false
		supplier nullable:true
		shipper nullable: true
		load nullable: true
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
