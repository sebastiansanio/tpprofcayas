package wish

class Picture {

	byte[] image
	String description
	
    static mapping = {
    }
    
	static constraints = {
		image size: 1..9999999
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
