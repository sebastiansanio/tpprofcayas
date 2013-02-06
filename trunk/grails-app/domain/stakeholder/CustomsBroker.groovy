package stakeholder
import wish.Wish


class CustomsBroker extends Stakeholder{

	static hasMany		= [wishes: Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
}
