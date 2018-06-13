package prices

/**
 * PriceVariableDate
 * A domain class describes the data object and it's mapping to the database
 */
import org.hibernate.envers.Audited

@Audited
class PriceVariableDate {

	Date	dateCreated
	Date	lastUpdated

	PriceVariable priceVariable
	Date dateFrom
	Date dateTo
	BigDecimal price
	
    static mapping = {
    }
    
	static constraints = {
		
		dateFrom nullable: false, unique: 'priceVariable'
		dateTo nullable: false
		priceVariable nullable: false
		price nullable: false
    }
	
	public String toString() {
		return priceVariable.toString()
	}
}
