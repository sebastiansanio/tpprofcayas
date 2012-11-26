package login

import java.util.Date;

class User {
    String username
    String passwordHash

	Date	dateCreated
	Date	lastUpdated
	
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
}
