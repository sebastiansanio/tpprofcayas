package wish

import java.io.Serializable;
import java.sql.Date;

import org.apache.commons.lang.builder.HashCodeBuilder
import stakeholder.Customer
import stakeholder.Forwarder


class LetterOfGuarantee implements Serializable {
	
	
	static hasOne		= [ customer:Customer, forwarder:Forwarder ]

	Date	dateCreated
	Date	lastUpdated
	Date 	deliveryDate
	int 	year

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
