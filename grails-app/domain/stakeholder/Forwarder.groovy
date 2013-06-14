package stakeholder
import wish.Wish

import org.hibernate.envers.Audited

@Audited
class Forwarder extends Stakeholder{

	static final String type = "forwarder"
	
	static hasMany		= [wishes: Wish]
    
	static constraints = {
    }
	
}
