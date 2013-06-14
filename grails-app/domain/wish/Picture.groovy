package wish
import org.hibernate.envers.Audited

@Audited
class Picture {

	byte[] image
	String description
    static mapping = {
    }
    
	static constraints = {
		image size: 1..9999999
		description blank:false,nullable:false
    }

	public String toString() {
		return description
	}
}
