package wish

import java.math.BigDecimal;

import org.hibernate.envers.Audited

import stakeholder.Customer

@Audited
class ProductWish {

	Date	dateCreated
	Date	lastUpdated
	
	Customer customer
	List items
	
	static hasMany		= [items: ProductWishItem]	
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	BigDecimal getTotal(){
		BigDecimal calculatedTotal = BigDecimal.valueOf(0)
		for(item in items){
			calculatedTotal = calculatedTotal.plus(item.total)
		}
		
		return calculatedTotal
	}
	

}
