package wish

import stakeholder.Customer
import stakeholder.Supplier

import org.hibernate.envers.Audited;

@Audited
class AluminumWish {

	static hasMany		= [ subWish: AluminumSubWish, subtotalExtras: SubtotalExtra ] 
	
	BigDecimal			lintongx

	Supplier			supplier	
	Customer			customer 
	String				code

	List				subWish
	
	static constraints = {
		code unique:true
    }

    def getTotal() {
		
		def total = 0
		
		subWish.each {
			total += it.total
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
		def total = 0
		
		subWish.each {
			total += it.amount
		}
		
		return total
	}
}
