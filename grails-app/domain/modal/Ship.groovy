package modal
import wish.Wish

class Ship {

	String name
	
	static hasMany = [wishes:Wish]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name
	}
}
