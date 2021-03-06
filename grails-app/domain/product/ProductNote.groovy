package product

import java.util.Date;

import org.hibernate.envers.Audited;

import login.User;

@Audited
class ProductNote {
	
	private static final String FORMAT = "dd/MM/yyyy"

	Date	dateCreated	
	String 	text
	User 	user
	
	static belongsTo	= [ product: AbstractProduct ]
	    
	static constraints = {
		text nullable:true, maxSize:512
    }
	
	public String toString() {
		return user.username +": "+ text + " (" + dateCreated.format(FORMAT) + ")"
	}
}
