package modal

import wish.Wish;
import org.hibernate.envers.Audited

@Audited
class WishStatus {


	String name
	String description
	
	static hasMany = [wishes: Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false
		description nullable:true
    }
	
	public String toString() {
		return name;
	}
}
