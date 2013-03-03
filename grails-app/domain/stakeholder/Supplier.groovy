package stakeholder
import wish.Wish

class Supplier extends Stakeholder{


	static hasMany		= [wishes: Wish]
	
	String address
	String taxRegistryNumber

    static mapping = {
    }
    
	static constraints = {
    }
	

}
