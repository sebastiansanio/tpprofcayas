package product

import org.hibernate.envers.Audited;

import stakeholder.Customer;

@Audited
class PricePerCustomer {

	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [product: Product]

	Customer	customer
	BigDecimal	price
		
	public String toString() {
		return price;
	}
}
