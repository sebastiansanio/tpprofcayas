package modal
import org.hibernate.envers.Audited

@Audited
class TypeOfFreight {

	String name	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
