package product

import org.hibernate.envers.Audited;

@Audited
class HistoricalPrice {

	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= [product: Product]
    
	BigDecimal	price
	
	static constraints = {
		price nullable:false, min:0.000, scale:4
    }
	
	public String toString() {
		return price;
	}
}
