package product
import wish.*

/**
 * Product
 * A domain class describes the data object and it's mapping to the database
 */
class Product {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	String descriptionES
	String description
	
	Color color
	Family family
	SubFamily subFamily
	
	Date	dateCreated
	Date	lastUpdated
	
	static belongsTo	= Load	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [loadsUnits: LoadUnit]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
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
