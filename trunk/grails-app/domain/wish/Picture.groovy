package wish

class Picture {

	byte[] image
	String description
    static mapping = {
    }
    
	static constraints = {
		image size: 1..9999999
		description blank:false,nullable:false
    }

	public String toString() {
		return description
	}
}
