package stakeholder
import org.hibernate.envers.Audited
import product.Family

@Audited
class CustomerFamilyMargin {

	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [customer: Customer, family: Family]
	BigDecimal margin
		
	
    static mapping = {
    }
    
	static constraints = {
		family unique: 'customer'
		margin min:0.0000, scale:4, nullable:false
    }
	

}
