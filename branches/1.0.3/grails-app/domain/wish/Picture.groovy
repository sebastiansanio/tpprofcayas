package wish
import org.hibernate.envers.Audited

@Audited
abstract class Picture {

	byte[] image
	String description
    
	static mapping = {
		tablePerHierarchy false
	}
	
	static constraints = {
		image size: 1..9999999
		description blank:false,nullable:false
    }

	public String toString() {
		return description
	}
}
