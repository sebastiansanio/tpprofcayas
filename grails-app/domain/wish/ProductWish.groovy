package wish

import org.hibernate.envers.Audited
import stakeholder.Customer

@Audited
class ProductWish {

	Date	dateCreated
	Date	lastUpdated
	
	Customer customer
	
	static hasMany		= []	
	
    static mapping = {
    }
    
	static constraints = {
    }
	

}
