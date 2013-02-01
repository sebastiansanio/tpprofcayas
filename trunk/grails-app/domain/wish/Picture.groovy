package wish

class Picture {

	byte[] image
	String description
    static mapping = {
    }
    
	static constraints = {
		image size: 1..9999999
    }

	public String toString() {
		return description
	}
}
