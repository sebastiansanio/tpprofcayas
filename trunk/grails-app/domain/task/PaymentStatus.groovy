package task

class PaymentStatus {

	String status
	
	static hasMany		= [payments:Payment]
		
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return status;
	}
}
