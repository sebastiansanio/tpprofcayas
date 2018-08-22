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

	Currency currencyFrom
	Currency currencyTo
	Date date
	BigDecimal value

	static mapping = {
	}

	static constraints = {
		currencyFrom nullable: false
		currencyTo nullable: false
		date nullable: false
		currencyTo unique: 'currencyFrom'
		value nullable: true, scale:5
	}

	public String toString() {
		return currencyFrom.toString() + " - " + currencyTo.toString()
	}
}
