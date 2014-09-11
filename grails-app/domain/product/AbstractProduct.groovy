package product

import java.util.List;

import org.hibernate.envers.Audited;

import stakeholder.Supplier

@Audited
class AbstractProduct {

	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [codePerCustomer: CodePerCustomer] 
	
	String 				descriptionSP
	String 				descriptionEN

	Supplier			supplier
	String				supplierCode

	ItemUnit			unit
	
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
