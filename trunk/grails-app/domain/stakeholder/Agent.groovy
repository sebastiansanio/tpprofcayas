package stakeholder
import wish.Wish

class Agent extends Stakeholder{

	static final String type = "agent"
	
	static hasMany		= [wishes: Wish]
    
	static constraints = {
    
	}
	
	
}
