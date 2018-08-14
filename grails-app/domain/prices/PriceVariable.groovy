package prices

/**
 * PriceVariable
 * A domain class describes the data object and it's mapping to the database
 */
import org.hibernate.envers.Audited

@Audited
class PriceVariable {

	Date	dateCreated
	Date	lastUpdated
	String name
	String description
	Date expireDate
	BigDecimal price

		
    static mapping = {
    }
    
	static constraints = {
		price nullable: true, scale:5
		name unique: true, blank:false, nullable:false
		description blank: true, nullable:true
    }
	
	public String toString() {
		return name
	}
}
