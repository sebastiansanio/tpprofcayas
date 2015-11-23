package wish

import stakeholder.Customer
import stakeholder.Supplier

import org.hibernate.envers.Audited

@Audited
class AluminumWish {

	Date dateCreated
	Date lastUpdated
	
	static hasMany		= [ subWish: AluminumSubWish, subtotalExtras: SubtotalExtra ] 
	
	BigDecimal			lintongx

	Supplier			supplier	
	Customer			customer 
	String				code

	List				subWish
	
	static constraints = {
		code unique:true
    }


}
