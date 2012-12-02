package task


class PriceCondition {
	
	String description
	
	static hasMany		= [payments:Payment]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return description;
	}
}
