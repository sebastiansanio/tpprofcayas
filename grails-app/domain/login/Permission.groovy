package login
import org.hibernate.envers.Audited

@Audited
class Permission {

	
	String description
	String permissionString
	
    static mapping = {
    }
    
	static constraints = {
		description nullable:false,blank:false,unique:true
		permissionString nullable:false,blank:false,unique:true
    }
	
	public String toString() {
		return description
	}
}
