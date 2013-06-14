package modal

import wish.Wish;
import org.hibernate.envers.Audited

@Audited
class PriceCondition {
	
	static hasMany		= [wishes:Wish]	
	
	String name
	String description
	
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false
		description nullable: true
		
    }
	
	public String toString() {
		return name;
	}
}
