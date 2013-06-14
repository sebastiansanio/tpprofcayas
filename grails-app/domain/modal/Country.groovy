package modal
import org.hibernate.envers.Audited

@Audited
class Country {

	String name
	
	static hasMany		= [ports: Port]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
