package product
import wish.*


class Product {

	String descriptionES
	String description
	
	Color color
	Family family
	SubFamily subFamily
	
	Date	dateCreated
	Date	lastUpdated
		
	static hasMany		= [loadsUnits: LoadUnit]	
	
    static mapping = {

	}
    
	static constraints = {
		descriptionES blank:false
		description blank:false
		color nullable: false
		family nullable: true, blank:true
		subFamily nullable: true, blank:true
		
    }
	
	public String toString() {
		return description;
	}
}
