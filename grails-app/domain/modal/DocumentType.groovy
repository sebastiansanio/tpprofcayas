package modal

class DocumentType {

	String name
	
		
    static mapping = {
    }
    
	static constraints = {
		name unique:true
    }
	

	public String toString() {
		return name
	}
}
