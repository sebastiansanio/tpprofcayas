package courier

import wish.Document

class DocumentsCourierRecord extends CourierRecord {
	
	static hasMany = [documents:Document]
	

}
