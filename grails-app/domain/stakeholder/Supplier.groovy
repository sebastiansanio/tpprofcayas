package stakeholder
import product.Extra
import product.Family
import wish.Wish
import org.hibernate.envers.Audited

@Audited
class Supplier extends Stakeholder{

	static final String type = "supplier"

	static hasMany		= [ wishes: Wish, extrasDefault: Extra]

	String 		address
	String 		taxRegistryNumber
	boolean 	aluminumSupplier

	BigDecimal	sellingFee

    static mapping = {
		
    }
    
	static constraints = {
		sellingFee nullable: true
    }
}
