package wish

import org.hibernate.envers.Audited

import product.Extra
import product.Aluminum

@Audited
class AluminumSubWish {

	static belongsTo	= [ wish: AluminumWish ]
	static hasMany		= [ extras: Extra ]

    static transients = ['subtotal']
    def 			subtotal = 0

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
	
	def getEstimatedGW() {
		if ( !aluminum.weightPCS )
			return 0

		return factorEstimated * totalTheoricalWeight
	}
	
	def getTotalTheoricalWeight() { //net weight
		return quantityPCS * aluminum.weightPCS
	}
	
	def getSubtotal() {

		if ( subtotal != 0 )
			return subtotal

		subtotal = wish.lintongx	
		extras.each {
			subtotal += it.getTotal( aluminum )	
		}
		
		subtotal = subtotal/1000

		return subtotal
	}
	
	def getPacking() { //5,5% packing
		def extraPacking = SubtotalExtra.findByCode( "PAC" )

		if ( !extraPacking ) return 0
		return (getSubtotal()/extraPacking.number) - getSubtotal()
	}

	def getTotal() {
		return getSubtotal() + getPacking() // U$S FOB x Tonelada*/
	}
	
	def getTotalAmountWithoutPacking() {
		return totalTheoricalWeight * getSubtotal()
	}
	
	def getTotalAmountWithPacking() {
		return totalTheoricalWeight * total
	}

	def getE2() {
		def extraE2 = SubtotalExtra.findByCode( "E2" )

		if ( !extraE2 ) return 0
		return extraE2.number * totalAmountWithoutPacking
	}

	def getPriceXpiece() {
		return e2 / quantityPCS
	}
	
	def calculateExtraValue(Extra extra){
		if(extras.contains(extra)){
			return extra.getTotal(aluminum)
		} else {
			return 0
		}
	}
	
}
