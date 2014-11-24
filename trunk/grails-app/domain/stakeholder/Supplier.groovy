package stakeholder
import wish.Wish

import org.hibernate.envers.Audited

import product.Extra;

@Audited
class Supplier extends Stakeholder{

	static final String type = "supplier"

	static hasMany		= [ wishes: Wish, extrasDefault: Extra ]

	String 		address
	String 		taxRegistryNumber
	boolean 	aluminumSupplier

    static mapping = {
    }
    
	static constraints = {
    }
}
