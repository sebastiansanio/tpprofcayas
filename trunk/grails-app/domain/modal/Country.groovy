package modal

class Country {

	String name
	
	static hasMany		= [ports: Port]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
