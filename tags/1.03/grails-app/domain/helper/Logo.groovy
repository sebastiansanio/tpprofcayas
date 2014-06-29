package helper


class Logo {

	String name
	byte[] image
	String mimeType
		
    static mapping = {
    }
    
	static constraints = {
		name nullable:false,unique:true,blank:false
		image maxSize: 999999,nullable:false
		mimeType nullable:false,inList: ["image/jpeg","image/png","image/gif"]
    }
	

	public String toString() {
		return name
	}
}
