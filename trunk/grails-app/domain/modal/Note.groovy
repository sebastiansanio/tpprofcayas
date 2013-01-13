package modal

class Note {
	
	Date dateCreated
	String text
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	public String toString() {
		return text
	}
}
