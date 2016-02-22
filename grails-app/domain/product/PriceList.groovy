package product

import org.hibernate.envers.Audited

import stakeholder.Supplier

@Audited
class PriceList {
    static belongsTo = [supplier: Supplier]
    static hasMany = [productsPrice: ProductPrice]
    
    String  name

	Date	dateCreated
	Date	lastUpdated
	    
	static constraints = {
    }
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${name}";
	}
}
