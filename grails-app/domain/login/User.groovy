package login

import java.util.Date;
import stakeholder.Stakeholder

class User {
    String username
    String passwordHash

	Date	dateCreated
	Date	lastUpdated
	Stakeholder stakeholder
	
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username nullable: false, blank: false, unique: true
		stakeholder nullable:true
		
    }
	
	String toString(){
		return username
	}
}
