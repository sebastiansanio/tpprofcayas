package product

import org.hibernate.envers.Audited

@Audited
class ProductPrice {
    static belongsTo = [list: PriceList]

    Product         product
    BigDecimal      price
	Date	        dateCreated
	Date	        lastUpdated

	static constraints = {
        price min:0.0000, scale:4
    }
	
	@Override
	public String toString() {
		return "${price}"
	}
}
