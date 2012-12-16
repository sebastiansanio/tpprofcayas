package wish

class PaymentStatus {

	String name
	String description
	
	static hasMany = [whishes: Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
