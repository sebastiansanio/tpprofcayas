package stakeholder
import wish.Wish

import org.hibernate.envers.Audited

@Audited
class Supplier extends Stakeholder{

	static final String type = "supplier"

	static hasMany		= [wishes: Wish]
	
	String address
	String taxRegistryNumber

    static mapping = {
    }
    
	static constraints = {
    }
	

}
