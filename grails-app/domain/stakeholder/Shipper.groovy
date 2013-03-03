package stakeholder
import wish.Wish

class Shipper extends Stakeholder{

	
    static hasMany		= [wishes: Wish]
	
	static constraints = {
    }
	

}
