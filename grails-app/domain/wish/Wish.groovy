package wish

import stakeholder.*

class Wish {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	Date	dateCreated
	Date	lastUpdated

	Person customer
	Person supplier
	Person shipper
		
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static hasOne		= [load:Load]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
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
