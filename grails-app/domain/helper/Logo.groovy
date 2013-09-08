package helper


class Logo {

	
	String name
	byte[] image
		
    static mapping = {
    }
    
	static constraints = {
		name nullable:false,unique:true
		image maxSize: 999999,nullable:false
    }
	

	public String toString() {
		return name
	}
}
