package modal

import org.hibernate.envers.Audited

@Audited
class ShippingMark {

	String name
		
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
