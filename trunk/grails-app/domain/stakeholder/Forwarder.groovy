package stakeholder
import wish.Wish

class Forwarder extends Stakeholder{

	static final String type = "forwarder"
	
	static hasMany		= [wishes: Wish]
    
	static constraints = {
    }
	
}
