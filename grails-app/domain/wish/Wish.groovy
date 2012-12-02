package wish

import stakeholder.*

class Wish {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	Date	dateCreated
	Date	lastUpdated

	String supplierOrder
	
	Long opNumber
	
	Stakeholder customer
	Stakeholder supplier
	Stakeholder shipper
		
	static hasOne		= [load:Load]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [tasks:Task]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
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