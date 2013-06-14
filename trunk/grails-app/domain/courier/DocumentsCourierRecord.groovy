package courier

import wish.Document
import org.hibernate.envers.Audited

@Audited
class DocumentsCourierRecord extends CourierRecord {
	
	static hasMany = [documents:Document]
	

}
