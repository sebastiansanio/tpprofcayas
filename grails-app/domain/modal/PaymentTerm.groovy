package modal

import wish.Wish;

class PaymentTerm {

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
