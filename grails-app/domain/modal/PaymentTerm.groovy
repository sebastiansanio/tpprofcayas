package modal

import wish.Wish;

class PaymentTerm {

	String name
	Integer percentPaymentAfterDelivery
	Integer paymentDaysAfterTimeOfArrival
	
	static hasMany = [wishes: Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false
		percentPaymentAfterDelivery nullable: false,min:0,max:100
		paymentDaysAfterTimeOfArrival nullable:true,min:0
    }
	
	boolean hasCad(){
		if(percentPaymentAfterDelivery==0)
			return false
		
		if(paymentDaysAfterTimeOfArrival != null || paymentDaysAfterTimeOfArrival == 0 )
			return true
		return false
	}
	
	Integer getPercentPaymentBeforeDelivery(){
		return 100 - percentPaymentAfterDelivery
	}
	
	public String toString() {
		return name;
	}
}
