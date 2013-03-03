package stakeholder
import wish.Wish

class Agent extends Stakeholder{

	
	static hasMany		= [wishes: Wish]
    
	static constraints = {
    
	}
	
	
}
