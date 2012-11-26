package login

import java.util.Date;

class Role {
    String name
	
	Date	dateCreated
	Date	lastUpdated

    static hasMany = [ users: User, permissions: String ]
    static belongsTo = User

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
