package product
import org.hibernate.envers.Audited

@Audited
class SubFamily {


	String description
	
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [family: Family]
	
	static constraints = {
		description unique:true, blank:false 
    }
	
	public String toString() {
		return description
	}
}
