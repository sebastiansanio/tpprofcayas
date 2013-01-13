package stakeholder
import wish.*

class Customer extends Stakeholder{

	
	static hasMany		= [wishes: Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	boolean hasOpNumber(Long number){
		boolean hasOpNumber = false
		wishes.each{
			if(it.customerOpNumber==number)
				hasOpNumber = true
		}
		return hasOpNumber
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
