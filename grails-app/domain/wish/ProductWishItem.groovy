package wish

import java.math.BigDecimal;

import org.hibernate.envers.Audited

import product.Product;

@Audited
class ProductWishItem {

	Date	dateCreated
	Date	lastUpdated
	
	Product product
	BigDecimal quantity
	BigDecimal unitPrice
	
	static belongsTo	= [wish: ProductWish]	
	
	static constraints = {
		quantity nullable:false,min:0.0001,scale:4
		unitPrice nullable:false,min:0.0001,scale:4
    }
	
	BigDecimal getTotal(){
		return quantity.multiply(unitPrice).setScale(2)
	}

}
