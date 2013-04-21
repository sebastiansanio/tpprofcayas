package stakeholder
import wish.Wish

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
