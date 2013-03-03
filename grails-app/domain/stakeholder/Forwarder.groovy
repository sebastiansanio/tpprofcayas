package stakeholder
import wish.Wish

class Forwarder extends Stakeholder{

	
	static hasMany		= [wishes: Wish]
    
	static constraints = {
    }
	
}
