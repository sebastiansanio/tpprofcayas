package wish

import login.User
import product.*

import org.hibernate.envers.Audited

@Audited
class LoadUnit {
	
	Product product
	BigDecimal quantity
	BigDecimal unitPrice
	Date cartonPrintingInfoSentDate
	User cartonPrintingInfoSentUser
	
	static belongsTo	= [wish:Wish]	
	
    static mapping = {
    }
    
	static constraints = {
		product nullable:false
		quantity nullable:false
		unitPrice nullable:true
		cartonPrintingInfoSentDate nullable:true
		cartonPrintingInfoSentUser nullable:true
    }
	
	String toString(){
		return product.toString() + " x " + quantity.setScale(2)
	}
	
}
