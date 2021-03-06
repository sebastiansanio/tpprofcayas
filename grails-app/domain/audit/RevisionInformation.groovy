package audit

import login.User
import org.hibernate.envers.RevisionEntity
import org.hibernate.envers.RevisionNumber
import org.hibernate.envers.RevisionTimestamp

import etc.ShiroRevisionListener;

@RevisionEntity(ShiroRevisionListener.class)
class RevisionInformation{

	@RevisionNumber
	Long id
	
	@RevisionTimestamp
	Date timestamp
	
	User currentUser

	static hasMany = [details:RevisionDetail]
		
	static constraints = {
		currentUser nullable: true
    }
	
}
