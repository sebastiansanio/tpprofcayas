package wish

import stakeholder.Customer
import stakeholder.Forwarder

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
		year min:2011 
	}
	
	@Override
	public String toString() {
		return "${customer} - ${forwarder} - ${year}";
	}
}
