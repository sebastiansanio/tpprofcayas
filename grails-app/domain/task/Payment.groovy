package task

class Payment {

//	Date	dateCreated
//	Date	lastUpdated
	
	static belongsTo	= [paymentStatus: PaymentStatus,priceCondition: PriceCondition,currency:Currency]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
//	public String toString() {
//		return "${name}";
//	}
}
