package wish

import stakeholder.Customer
import stakeholder.Supplier

import org.hibernate.envers.Audited

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

	def getFobShenzhenWithoutPacking() {
		def total = 0

		subWish.each {
			total += it.totalAmountWithoutPacking
		}
		return total
	}

	def getFobShenzhenWithPacking() {
		def total = 0
		
		subWish.each {
			total += it.totalAmountWithPacking
		}
		return total
	}
	
	def getDifferentBetweenWithAndWithoutPacking() {
		return fobShenzhenWithPacking - fobShenzhenWithoutPacking
	}

	def getAmountToBeDeclareAtChinesseCustom() {
		return fobShenzhenWithoutPacking * 1.1
	}

	def getDifferent() {
		def moldCost = SubtotalExtra.findByCode( "MOL" )

		if ( !moldCost ) return 0
		return amountToBeDeclareAtChinesseCustom - moldCost.number - fobShenzhenWithPacking
	}

	def getDiscountXextras() {
		//descuento del 10%
		return ( different + differentBetweenWithAndWithoutPacking ) * 0.1
	}

	def getNetFinalDifference() {
		return different - discountXextras
	}
}
