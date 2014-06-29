package product

import java.util.Date;

import org.hibernate.envers.Audited;

@Audited
class ItemUnit {

	Date	dateCreated
	Date	lastUpdated
	
	String	description
		
	public String toString() {
		return description
	}
}
