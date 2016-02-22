package stakeholder
import product.Extra
import product.Family
import product.PriceList
import wish.Wish
import org.hibernate.envers.Audited

@Audited
class Supplier extends Stakeholder{

	static final String type = "supplier"

	static hasMany		= [ wishes: Wish, extrasDefault: Extra, priceLists: PriceList]

	String 		address
	String 		taxRegistryNumber
	boolean 	aluminumSupplier

    static mapping = {
		
    }
    
	static constraints = {
		
    }
}
