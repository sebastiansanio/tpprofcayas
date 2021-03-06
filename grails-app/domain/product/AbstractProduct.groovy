package product

import java.util.List;

import modal.Country;
import modal.Currency;
import modal.Port;
import modal.PriceCondition;

import org.hibernate.envers.Audited;

import stakeholder.Shipper;
import stakeholder.Supplier

@Audited
class AbstractProduct {

	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [ codePerCustomer: CodePerCustomer, notes: ProductNote ] 
	
	String 				descriptionSP
	String 				descriptionEN

	Supplier			supplier
	String				supplierCode

	ItemUnit			unit
	
	Currency			currency
	PriceCondition		priceCondition
	BigDecimal			pricePerUnit
	
	Port				port
	Port				consolidationArea
	
	Shipper				shipper
	Country				country
	BigDecimal			criterionValue
	BigDecimal			tax //serían los derechos
	
	BigDecimal 			netWeightPerBox
	BigDecimal 			grossWeightPerBox

	List				codePerCustomer
	
	List 				notes
	
    static mapping = {
    	tablePerHierarchy false    	
    }
    
	static constraints = {
		descriptionSP blank:false
		descriptionEN blank:false
		supplier nullable:true
		supplierCode blank:true, nullable:true 
		unit  nullable:true
		currency nullable:true
		priceCondition nullable:true
		pricePerUnit min:0.0000, scale:4, nullable:true
		port nullable:true
		consolidationArea nullable:true
		shipper nullable:true
		tax min:0.00, max:100.00, scale:2, nullable:true
		country nullable:true
		criterionValue min:0.0000, scale:4, nullable:true
		netWeightPerBox min:0.0000, scale:4, nullable:true
		grossWeightPerBox min:0.0000, scale:4, nullable:true
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
    }
	
	public String toString() {
		return descriptionEN;
	}
		
	def setCountry() {
		if ( country == null && supplier != null )
			country = supplier.country
	}
	
	def beforeInsert() {
		setCountry()
	}
	
	def beforeUpdate() {
		setCountry()
	}
}
