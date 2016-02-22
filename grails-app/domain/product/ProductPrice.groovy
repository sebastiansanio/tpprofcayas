package product

import org.hibernate.envers.Audited

@Audited
class ProductPrice {
    static belongsTo = [list: PriceList]

    Product         product
    BigDecimal      price
	Date	        dateCreated
	Date	        lastUpdated
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${price}";
	}
}
