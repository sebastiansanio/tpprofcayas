package prices
/**
 * ExchangeRate
 * A domain class describes the data object and it's mapping to the database
 */
import org.hibernate.envers.Audited
import modal.Currency

@Audited
class ExchangeRate {

	Date	dateCreated
	Date	lastUpdated

	Currency currency
	Date date
	BigDecimal value

	static mapping = {
	}

	static constraints = {
		currency nullable: false
		date nullable: false, unique: 'currency'
		value nullable: false
	}

	public String toString() {
		return currency.toString() + " (" + date.format("dd/MM/yyyy") + ")"
	}
}
