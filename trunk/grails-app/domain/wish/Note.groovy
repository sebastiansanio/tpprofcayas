package wish

import login.User

class Note {
	
	Date dateCreated
	String text
	User user
	
    static mapping = {
    }
    
	static constraints = {
		text nullable:true
    }
	
	public String toString() {
		return user.username +": "+ text + " (" + dateCreated.format("dd/MM/yyyy") + ")"
	}
}
