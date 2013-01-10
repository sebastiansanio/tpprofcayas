package wish

class Draft {

	byte[] draft
	String description
		
    static mapping = {
    }
    
	static constraints = {
		draft size: 1..9999999
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
