package stakeholder
import modal.Country
import wish.*

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
