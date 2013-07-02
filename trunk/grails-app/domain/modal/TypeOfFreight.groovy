package modal
import org.hibernate.envers.Audited

@Audited
class TypeOfFreight {

	String name	
	boolean requiresPicturesOfLoadingContainer
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
