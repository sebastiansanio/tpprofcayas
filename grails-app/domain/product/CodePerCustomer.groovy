package product

import org.hibernate.envers.Audited;

import stakeholder.Customer

@Audited
class CodePerCustomer {

	Date		dateCreated
	Date		lastUpdated
	
	static belongsTo	= [product: AbstractProduct]

	Customer	customer
	String		code
   
	static constraints = {
		customer nullable:false
		code blank:false
    }
	 
	public String toString() {
		return code;
	}
}
