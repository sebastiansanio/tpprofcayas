package wish

class Draft {

	byte[] draft
	String description
		
	static belongsTo	= [wish:Wish]
	
    static mapping = {
    }
    
	static constraints = {
		draft size: 1..9999999
    }
	
	public String toString() {
		return description
	}
}
