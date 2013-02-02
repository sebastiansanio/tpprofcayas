package modal

import login.User

class Note {
	
	Date dateCreated
	String text
	User user
	
    static mapping = {
    }
    
	static constraints = {
		
    }
	
	public String toString() {
		return text
	}
}
