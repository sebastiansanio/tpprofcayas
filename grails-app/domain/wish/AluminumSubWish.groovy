package wish

import org.hibernate.envers.Audited;

import product.Extra;
import product.Aluminum;

@Audited
class AluminumSubWish {

	static belongsTo	= [ wish: AluminumWish ]
	static hasMany		= [ extras: Extra ]

	Aluminum		aluminum
	Long			quantityPCS
	    
	BigDecimal		factorEstimated = 1.03
	
	static constraints = {
		quantityPCS min:1L
		factorEstimated min:1.00, scale:2
    }
	
	def getQuantityOfBundles() {
		return quantityPCS / aluminum.pcsBundle
	}
	
	def getTotalCBM() {
		return quantityOfBundles * aluminum.cBMPerBundle
	}
	
	def getSectionArea() {		
		return aluminum.sectionalL/1000 * aluminum.sectionalW/1000 * quantityPCS/ aluminum.pcsBundle
	}
	
	def getTotalTheoricalWeight() {
		return quantityPCS * aluminum.weightPCS
	}
	
	def getEstimatedGW() {
		return factorEstimated * totalTheoricalWeight
	}
	
	def getSubtotal() {
		
		def subtotal = 0
		
		extras.each {
			subtotal += it.getTotal( aluminum )	
		}
		
		return subtotal
	}
}
