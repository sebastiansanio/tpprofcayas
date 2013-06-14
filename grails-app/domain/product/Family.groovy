package product

import org.hibernate.envers.Audited

@Audited
class Family {


	String description
	
	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [products: Product]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return description;
	}
}
