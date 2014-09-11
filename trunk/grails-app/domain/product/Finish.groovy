package product

import org.hibernate.envers.Audited;

@Audited
class Finish {

	Date	dateCreated
	Date	lastUpdated

	String  description

	static constraints = {
		description blank:false
    }
	
	@Override
	public String toString() {
		return "${description}";
	}
}
