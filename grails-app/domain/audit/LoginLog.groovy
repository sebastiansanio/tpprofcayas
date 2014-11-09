package audit

import login.User

class LoginLog {

	User user
	Date dateCreated
	
    static mapping = {
		version false
    }
    
	static constraints = {
    }
	

	public String toString() {
		return user.toString() + "(" + dateCreated.toString() + ")"
	}
}
