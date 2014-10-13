package wish

import org.hibernate.envers.Audited;

import product.Extra;
import product.Aluminum;

@Audited
class AluminumSubWish {

	static belongsTo	= [ wish: AluminumWish ]
	static hasMany		= [ extras: Extra, subtotalExtras: SubtotalExtra ]

	Aluminum		aluminum
	Long			quantityPCS
	    
	BigDecimal		factorEstimated = 1.03
	
	static constraints = {
		quantityPCS min:1L
		factorEstimated min:1.00, scale:2
    }
	
	def getQuantityOfBundles() {
		if ( !aluminum.pcsBundle )
			return 0

		return quantityPCS / aluminum.pcsBundle
	}
	
	def getTotalCBM() {
		return quantityOfBundles * aluminum.cBMPerBundle
	}
	
	def getSectionArea() {	
		if ( !aluminum.pcsBundle )
			return 0
	
		return aluminum.sectionalL/1000 * aluminum.sectionalW/1000 * quantityPCS/ aluminum.pcsBundle
	}
	
	def getTotalTheoricalWeight() {
		if ( !aluminum.weightPCS )
			return 0

		return quantityPCS * aluminum.weightPCS
	}
	
	def getEstimatedGW() {
		if ( !aluminum.weightPCS )
			return 0

		return factorEstimated * totalTheoricalWeight
	}
	
	def getSubtotal() {
		
		def subtotal = wish.lintongx
		
		extras.each {
			subtotal += it.getTotal( aluminum )	
		}
		
		return subtotal
	}
	
	def getTotal() {
		
		def total = getSubtotal()
		
		subtotalExtras.each {
			total += it.getTotal( this )
		}
		
		return total // U$S FOB x Tonelada*/
	}
	
	def getFobxPiece() {
		if ( !aluminum.weightPCS )
			return 0
			
		/*getTotal()/1000 = U$S FOB x KG*/
		return getTotal()/1000 * aluminum.weightPCS
	}
	
	def getAmount() {
		return getFobxPiece() * quantityPCS
	}

}
