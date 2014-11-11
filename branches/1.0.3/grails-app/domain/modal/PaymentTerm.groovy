package modal

import wish.Wish;
import org.hibernate.envers.Audited

@Audited
class PaymentTerm {

	String name
	Integer percentPaymentAfterDelivery
	Integer paymentDaysAfterTimeOfArrival
	boolean requiresAdvancePayment
	
	static hasMany = [wishes: Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		name blank:false
		percentPaymentAfterDelivery nullable: false,min:0,max:100
		paymentDaysAfterTimeOfArrival nullable:true,min:0
    }
	
	Integer getPercentPaymentBeforeDelivery(){
		return 100 - percentPaymentAfterDelivery
	}
	
	public String toString() {
		return name;
	}
}
