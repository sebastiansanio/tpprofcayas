package task
import wish.*

class Payment extends Task {


	static belongsTo	= [paymentTerm: PaymentTerm,paymentStatus: PaymentStatus,priceCondition: PriceCondition,currency:Currency]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
//	public String toString() {
//		return "${name}";
//	}
}
