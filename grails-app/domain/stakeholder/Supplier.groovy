package stakeholder
import wish.Wish

class Supplier extends Stakeholder{


	String address
	String taxRegistryNumber
	
	static hasMany		= [wishes: Wish]
		
    static mapping = {
    }
    
	static constraints = {
    }
	

}
