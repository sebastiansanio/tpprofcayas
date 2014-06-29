package product

import org.hibernate.envers.Audited;

@Audited
class TypeOfPresentation {

	Date	dateCreated
	Date	lastUpdated
	
	String	description
		
	public String toString() {
		return description
	}
}
