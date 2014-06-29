package wish

import stakeholder.Customer
import stakeholder.Forwarder
import org.hibernate.envers.Audited

@Audited
class LetterOfGuarantee {
	
	
	Customer	customer
	Forwarder	forwarder

	Date		dateCreated
	Date		lastUpdated
	Date 		deliveryDate
	int 		year

	static constraints = {
		
		year(unique: ['forwarder', 'customer'])
		deliveryDate nullable:true
		year min:0
	}
	
	@Override
	public String toString() {
		return "${customer} - ${forwarder} - ${year}";
	}
}
