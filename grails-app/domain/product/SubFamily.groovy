package product
import org.hibernate.envers.Audited

@Audited
class SubFamily {


	String description
	
	Date	dateCreated
	Date	lastUpdated
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return description
	}
}
