package product

import java.util.Date;

import stakeholder.Shipper
import stakeholder.Supplier
import modal.Country;
import modal.Port
import modal.PriceCondition
import modal.Currency
import wish.LoadUnit

import org.hibernate.envers.Audited

@Audited
class Product {

	static final Integer UNITS_PER_CONTAINER_WEIGHT = 25500
	static final Integer UNITS_PER_CONTAINER_VOLUME = 27
	
	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [loadsUnits: LoadUnit, codePerCustomer: CodePerCustomer, pricePerCustomer: PricePerCustomer, previousPrices: HistoricalPrice]
	
	String 				descriptionSP
	String 				descriptionEN
	
	Color 				color
		
	String				supplierCode
	String				customerCode
	
	String				status
	
	List				codePerCustomer
	
	ItemUnit			unit
	Currency			currency
	PriceCondition		priceCondition
	List				previousPrices	
	BigDecimal			pricePerUnit
	List				pricePerCustomer
	
	Port				port
	Port				consolidationArea

	Family				family
	SubFamily			subFamily
	String				attribute
	TypeOfPresentation	typeOfPresentation
	Supplier			supplier
	Shipper				shipper
	Country				country
	BigDecimal			criterionValue
	String				hsCode
	BigDecimal			tax //serían los derechos
	
	Long				quantityPerCarton
	Long				innerBoxQuantity
	Long				articlesQuantityPerInnerBox
	BigDecimal 			netWeightPerBox
	BigDecimal 			grossWeightPerBox
	BigDecimal 			outerBoxLength
	BigDecimal 			outerBoxWidth
	BigDecimal 			outerBoxHeight
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
		status inList: ["Stock", "Discontinuado"]
		unit  nullable:true
		currency nullable:true
		family nullable:false
		subFamily nullable:true
		typeOfPresentation nullable:true
		supplier nullable:true
		shipper nullable:true
		tax min:0.00, max:100.00, scale:2, nullable:true
		priceCondition nullable:true
		pricePerUnit min:0.0000, scale:4, nullable:true
		port nullable:true
		consolidationArea nullable:true
		country nullable:true
		criterionValue min:0.0000, scale:4, nullable:true
		quantityPerCarton min:0L, nullable:true
		innerBoxQuantity min:0L, nullable:true
		articlesQuantityPerInnerBox min:0L, nullable:true
		netWeightPerBox min:0.0000, scale:4, nullable:true
		grossWeightPerBox min:0.0000, scale:4, nullable:true
		outerBoxLength min:0.0000, scale:4, nullable:true
		outerBoxWidth min:0.0000, scale:4, nullable:true
		outerBoxHeight min:0.0000, scale:4, nullable:true
		innerBoxLength min:0.0000, scale:4, nullable:true
		innerBoxWidth min:0.0000, scale:4, nullable:true
		innerBoxHeight min:0.0000, scale:4, nullable:true
		boxesPerPallets min:0L, nullable:true
		piecesPerPallet min:0L, nullable:true
		notes nullable:true, maxSize:512
		codePerCustomer(validator: { listCodePerCustomer, obj, errors ->
			
			if ( listCodePerCustomer != null && listCodePerCustomer.size() != 0 )
			{
				def customers = [] as Set
	
				listCodePerCustomer.each {
					customers.add(it.customer)
				}
	
				if ( listCodePerCustomer.size() != customers.size() )
				{
					errors.rejectValue("codePerCustomer", "product.codePerCustomer.customerrepeat" )
					return false
				}
			}
			return true
		})
		
		pricePerCustomer(validator: { listPricePerCustomer, obj, errors ->
			
			if ( listPricePerCustomer != null && listPricePerCustomer.size() != 0 )
			{
				def customers = [] as Set
	
				listPricePerCustomer.each {
					customers.add(it.customer)
				}
	
				if ( listPricePerCustomer.size() != customers.size() )
				{
						errors.rejectValue("pricePerCustomer", "product.pricePerCustomer.customerrepeat" )
						return false 
				}
			}
			return true
		})
    }
	
	public String toString() {
		return descriptionEN;
	}
	
	BigDecimal getValuePerKilo() {
		
		if ( netWeightPerBox == null || netWeightPerBox == 0.0 || pricePerUnit == null || quantityPerCarton == null )
			return 0.0
			
		return 	quantityPerCarton * pricePerUnit / netWeightPerBox
	}
	
	BigDecimal getOuterBoxVolume() {
		
		if ( outerBoxLength == null || outerBoxHeight == null || outerBoxWidth == null )
			return 0.0
		return outerBoxLength * outerBoxHeight * outerBoxWidth
	}
	
	BigDecimal getUnitsPerContainerWeight() {
		
		if ( grossWeightPerBox == null || grossWeightPerBox == 0.0 || quantityPerCarton == null )
			return 0.0;
			
		return UNITS_PER_CONTAINER_WEIGHT / grossWeightPerBox * quantityPerCarton
	}
	
	BigDecimal getUnitsPerContainerVolume() {
		
		if ( getOuterBoxVolume() == 0.0 || quantityPerCarton == null )
			return 0.0;
			
		return UNITS_PER_CONTAINER_VOLUME / getOuterBoxVolume() * quantityPerCarton
	}
}
