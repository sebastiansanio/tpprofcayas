package stakeholder
import wish.Wish

import org.hibernate.envers.Audited

@Audited
class CustomsBroker extends Stakeholder{

	static final String type = "customsBroker"
	
    static hasMany		= [wishes: Wish]
	
	static constraints = {
    }
	
}
