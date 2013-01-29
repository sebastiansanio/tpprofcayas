package wish

import login.User
import product.*

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
    }
	
	
}
