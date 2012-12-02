package task

import wish.Wish;

class PaymentTerm {

//	Date	dateCreated
//	Date	lastUpdated
	
	static hasMany		= [payments:Payment]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
