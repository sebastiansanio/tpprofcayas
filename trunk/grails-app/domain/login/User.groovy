package login

import java.util.Date;
import stakeholder.Stakeholder
import org.hibernate.envers.Audited

@Audited
class User {
    String username
    String passwordHash

	Date	dateCreated
	Date	lastUpdated
	Stakeholder stakeholder
	
	String name
	int loginAttempts
	boolean blocked
	
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username nullable: false, blank: false, unique: true
		stakeholder nullable:true
		name nullable:true,blank:true
		
    }
	
	String toString(){
		return username
	}
}
