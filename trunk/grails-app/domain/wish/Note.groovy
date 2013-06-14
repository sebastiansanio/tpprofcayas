package wish

import login.User

import org.hibernate.envers.Audited

@Audited
class Note {
	
	Date dateCreated
	String text
	User user
	
	
    
	static constraints = {
		text nullable:true
    }
	
	public String toString() {
		return user.username +": "+ text + " (" + dateCreated.format("dd/MM/yyyy") + ")"
	}
}
