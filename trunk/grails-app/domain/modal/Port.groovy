package modal

class Port {

	
	String name
	
	static belongsTo	= [country: Country]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return name;
	}
}
