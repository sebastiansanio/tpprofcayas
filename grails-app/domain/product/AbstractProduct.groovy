package product

import java.math.BigDecimal;
import java.util.List;

import modal.Currency;
import modal.Port;
import modal.PriceCondition;

import org.hibernate.envers.Audited;

import stakeholder.Supplier

@Audited
class AbstractProduct {

	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [ codePerCustomer: CodePerCustomer ] 
	
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
	
	BigDecimal 			netWeightPerBox
	BigDecimal 			grossWeightPerBox

	List				codePerCustomer
	
    static mapping = {
    	tablePerHierarchy false    	
    }
    
	static constraints = {
		descriptionSP blank:false
		descriptionEN blank:false
		supplier nullable:true
		unit  nullable:true
		currency nullable:true
		priceCondition nullable:true
		pricePerUnit min:0.0000, scale:4, nullable:true
		port nullable:true
		consolidationArea nullable:true
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
}
