package prices

/**
 * CustomerPriceCriteria
 * A domain class describes the data object and it's mapping to the database
 */
import org.hibernate.envers.Audited
import product.Family

@Audited
class CustomerPriceCriteria {

	Date	dateCreated
	Date	lastUpdated
	CustomerGroup customerGroup
	Family family
	BigDecimal comission
	BigDecimal extra1
	BigDecimal extra2
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
