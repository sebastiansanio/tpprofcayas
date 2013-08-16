package product

import java.util.Currency;
import java.util.Date;

import stakeholder.Shipper
import stakeholder.Supplier
import modal.Country;
import modal.Port
import modal.PriceCondition
import wish.LoadUnit

import org.hibernate.envers.Audited

@Audited
class Product {

	static final Integer UNITS_PER_CONTAINER_WEIGHT = 25500
	static final Integer UNITS_PER_CONTAINER_VOLUME = 27
	
	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [loadsUnits: LoadUnit]	
	
	String 				descriptionSP
	String 				descriptionEN
	
	Color 				color
		
	String				supplierCode
	String				customerCode
	
	String				status
	
	//las cosas raras
	
	ItemUnit			unit
	Currency			currency
	PriceCondition		priceCondition
	BigDecimal			previousPrice
	
	//PRECIO POR UNIDAD DE VENTA / UNIT PRICE (MR)
	//PRECIO POR UNIDAD DE VENTA / UNIT PRICE (DP)
	//PRECIO POR UNIDAD DE VENTA / UNIT PRICE

	Port				port
	Port				consolidationArea

	Family				family
	SubFamily			subFamily
	String				atribute
	TypeOfPresentation	typeOfPresentation
	Supplier			supplier
	Shipper				shipper
	Country				contry
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
		descriptionSP blank:false
		descriptionEN blank:false
		color nullable:true
		status inList: ["Sock", "Discontinuado"]
		unit  nullable:true
		currency nullable:true
		family nullable:true, blank:true
		subFamily nullable:true, blank:true
		typeOfPresentation nullable:true
		supplier nullable:true
		tax min:0L, max:100L
    }
	
	public String toString() {
		return descriptionEN;
	}
}
