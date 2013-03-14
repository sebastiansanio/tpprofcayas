package wish

class Draft {

	String description
	String fileName
	byte[] draft
		
	static belongsTo	= [wish:Wish]
	
    static mapping = {
    }
    
	static constraints = {
		draft size: 1..9999999
		description nullable:true,blank:true
		fileName nullable:false,blank:false
    }
	
	public String toString() {
		return description
	}
}
