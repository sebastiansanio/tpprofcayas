package modal
import org.hibernate.envers.Audited

@Audited
class Port {

	
	String name
	
	static belongsTo	= [country: Country]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
