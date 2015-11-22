package product

import org.hibernate.envers.Audited

@Audited
class Family {


	String description
	
	Date	dateCreated
	Date	lastUpdated
	BigDecimal margin
	
	static hasMany		= [products: Product, subFamily: SubFamily]
	
	static constraints = {
		description unique:true, blank:false
		margin min:0.0000, scale:4, nullable:false
    }
	
	public String toString() {
		return description;
	}
	
	def beforeValidate(){
		if(!margin){
			margin = BigDecimal.valueOf(0)
		}
	}
}
