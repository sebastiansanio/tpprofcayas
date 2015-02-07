package aluminum

import wish.AluminumWish
import wish.SubtotalExtra

class AluminumCalculator{

	def fobShenzhenWithoutPacking
	def fobShenzhenWithPacking
	def different

	AluminumCalculator( AluminumWish aluminumWish ){
		calculateFobShenzhenWithoutPacking( aluminumWish )
		calculateFobShenzhenWithPacking( aluminumWish )
		calculateDifferent()	
	}

	private void calculateFobShenzhenWithoutPacking( AluminumWish aluminumWish ) {
		this.fobShenzhenWithoutPacking = 0

		aluminumWish.subWish.each {
			this.fobShenzhenWithoutPacking += it.totalAmountWithoutPacking
		}
	}

	private void calculateFobShenzhenWithPacking( AluminumWish aluminumWish ) {
		this.fobShenzhenWithPacking = 0
		
		aluminumWish.subWish.each {
			this.fobShenzhenWithPacking += it.totalAmountWithPacking
		}
	}
	
	private void calculateDifferent() {
		def moldCost = SubtotalExtra.findByCode( "MOL" )

		different = ( !moldCost )? 0 : ( getAmountToBeDeclareAtChinesseCustom() - moldCost.number - fobShenzhenWithPacking )
	}

	def getDifferentBetweenWithAndWithoutPacking() {
		return fobShenzhenWithPacking - fobShenzhenWithoutPacking
	}

	def getAmountToBeDeclareAtChinesseCustom() {
		return fobShenzhenWithoutPacking * 1.1
	}

	def getDiscountXextras() {
		//descuento del 10%
		return ( different + getDifferentBetweenWithAndWithoutPacking() )  * 0.1
	}

	def getNetFinalDifference() {
		return different - getDiscountXextras()
	}
}
