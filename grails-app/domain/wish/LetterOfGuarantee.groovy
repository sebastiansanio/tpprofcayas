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

    boolean equals(other) {
        if (!(other instanceof LetterOfGuarantee)) {
            return false
        }

        other.customer == customer && other.forwarder == forwarder && other.year == year
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append customer
		builder.append forwarder
		builder.append year
        builder.toHashCode() 
    }

    static mapping = {
        id composite: ['customer', 'forwarder', 'year']
    }
	
	static constraints = {
		
		deliveryDate nullable:true
	}
	
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
