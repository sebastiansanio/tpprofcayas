package stakeholder
import wish.Wish
import org.hibernate.envers.Audited

@Audited
class Agent extends Stakeholder{

	static final String type = "agent"
	
	static hasMany		= [wishes: Wish]
    
	static constraints = {
    
	}
	
	
}
