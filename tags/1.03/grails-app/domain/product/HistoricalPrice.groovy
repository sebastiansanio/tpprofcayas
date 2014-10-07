
package product
import org.hibernate.envers.Audited;

@Audited
class HistoricalPrice {
	
	static belongsTo	= [product: Product]
    
	Date		dateFrom
	BigDecimal	price
	
	static constraints = {
		price nullable:false, min:0.000, scale:4
    }
	
	public String toString() {
		return price;
	}
}