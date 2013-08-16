package product

import stakeholder.Shipper
import stakeholder.Supplier
import modal.Port
import modal.PriceCondition

class Item {

	static final Integer UNITS_PER_CONTAINER_WEIGHT = 25500
	static final Integer UNITS_PER_CONTAINER_VOLUME = 27
	
	Date	dateCreated
	Date	lastUpdated
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping
	
	String 				descriptionSP
	String 				descriptionEN
	
	Color 				color
		
	String				supplierCode
	String				customerCode
	
	ItemState			state
	
	//las cosas raras
	
	ItemUnit			unit
	Currency			currency
	PriceCondition		priceCondition
	BigDecimal			previousPrice
	
	//PRECIO POR UNIDAD DE VENTA / UNIT PRICE (MR)
	//PRECIO POR UNIDAD DE VENTA / UNIT PRICE (DP)
	//PRECIO POR UNIDAD DE VENTA / UNIT PRICE

	Port				port
	//ÁREA DE CONSOLIDACIÓN

	Family				family
	SubFamily			subFamily
	String				atribute
	TypeOfPresentation	typeOfPresentation
	Supplier			supplier
	//PROVEEDOR en cambio
	Shipper				shipper
	BigDecimal			criterionValue
	BigDecimal			valuePerKilo
	String				hsCode
	Long				tax //serían los derechos
	
	Long				quantityPerCarton
	Long				innerBoxQuantity
	Long				articlesQuantityPerInnerBox
	BigDecimal 			netWeightPerBox
	BigDecimal 			grossWeightPerBox
	String				outterDimensionUnit
	BigDecimal 			outterBoxLength
	BigDecimal 			outterBoxWidth
	BigDecimal 			outterBoxHeight
	String				innerDimensionUnit
	BigDecimal 			innerBoxLength
	BigDecimal 			innerBoxWidth
	BigDecimal 			innerBoxHeight
	
	Long				boxesPerPallets
	Long				piecesPerPallet
	
	String				notes
	
	static mapping = {
	}
	
	static constraints = {
		color nullable:true
		state nullable:true
		unit  nullable:true
		currency nullable:true
		family nullable:true, blank:true
		subFamily nullable:true, blank:true
		typeOfPresentation nullable:true
		supplier nullable:true
		
		tax min:0L, max:100L
	}
	
	public String toString() {
		return descriptionSP
	}
	
}
