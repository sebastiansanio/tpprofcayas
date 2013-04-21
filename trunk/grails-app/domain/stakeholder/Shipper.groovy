package stakeholder
import wish.Wish

class Shipper extends Stakeholder{

	static final String type = "shipper"
	
    static hasMany		= [wishes: Wish]
	
	static constraints = {
    }
	

}
