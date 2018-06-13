package prices

import product.Product

import org.hibernate.envers.Audited

@Audited
class SupplierPriceCriteria {

	Date	dateCreated
	Date	lastUpdated

	Product product
	PriceVariable variable
	BigDecimal priceVariableFrom
	BigDecimal priceVariableTo
	BigDecimal basePrice1
	BigDecimal basePrice2

	static mapping = {
	}

	static constraints = {
		product nullable: false
		variable nullable: true
		priceVariableFrom nullable: true
		priceVariableTo nullable: true
		basePrice1 nullable: false
		basePrice2 nullable: false
	}

	public String toString() {
		return product.toString()
	}
}
