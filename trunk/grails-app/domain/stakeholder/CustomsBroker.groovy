package stakeholder
import wish.Wish


class CustomsBroker extends Stakeholder{

	static final String type = "customsBroker"
	
    static hasMany		= [wishes: Wish]
	
	static constraints = {
    }
	
}
