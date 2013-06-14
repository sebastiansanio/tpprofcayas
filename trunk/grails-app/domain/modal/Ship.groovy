package modal
import wish.Wish

import org.hibernate.envers.Audited

@Audited
class Ship {

	String name
	
	static hasMany = [wishes:Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
