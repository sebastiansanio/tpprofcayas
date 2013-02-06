package modal

import wish.Wish;

class PaymentStatus {

	String name
	String description
	
	static hasMany = [wishes: Wish]
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false, unique:true
		description nullable:true
    }
	
	public String toString() {
		return name
	}
}
