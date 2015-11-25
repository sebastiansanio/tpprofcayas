package report

import java.util.Date;
import java.util.List;

import org.hibernate.envers.Audited

@Audited
class ProductWishReport {

	Date	dateCreated
	Date	lastUpdated
	List fields
	
	static hasMany		= [fields: String]
	
	String name
	
    static mapping = {
    }
    
	static constraints = {
		name nullable:false,blank:false
    }
	
	public String toString() {
		return name
	}
}
