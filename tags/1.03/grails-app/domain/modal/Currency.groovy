package modal
import org.hibernate.envers.Audited

@Audited
class Currency {

	String name
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
