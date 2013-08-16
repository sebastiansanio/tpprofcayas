package product

import org.hibernate.envers.Audited

@Audited
class Family {


	String description
	
	Date	dateCreated
	Date	lastUpdated
	
	static hasMany		= [products: Product, subFamily: SubFamily]
	
	static constraints = {
		description unique:true, blank:false
    }
	
	public String toString() {
		return description;
	}
}
