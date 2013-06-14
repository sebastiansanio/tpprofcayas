package stakeholder
import modal.Country
import wish.*
import org.hibernate.envers.Audited

@Audited
class Customer extends Stakeholder{

	static final String type = "customer"
	
	String address
	String cuit

	static hasMany		= [wishes: Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	
}
