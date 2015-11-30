package wish

import java.math.BigDecimal;

import modal.Country
import modal.PriceCondition
import modal.ShippingMark

import org.hibernate.envers.Audited

import stakeholder.Customer

@Audited
class ProductWish {

	Date	dateCreated
	Date	lastUpdated
	
	Customer customer
	List items
	
	String code
	int codeNumber
	String prefix
	
	Date deliveryDate
	Date arrivalDate
	boolean hasAdvancedPayment
	String currencyExchangeInformation
	BigDecimal freight
	Country countryOfOrigin
	Country countryOfProcedence
	PriceCondition priceCondition
	ShippingMark shippingMark
	
	String notes
	
	static hasMany		= [items: ProductWishItem]	
	
    static mapping = {
    }
    
	static constraints = {
		freight nullable:false,min:0.0001,scale:4
		notes blank:true,nullable:true
		code unique: true
		notes nullable:true,maxSize:512
		shippingMark nullable: true
		priceCondition nullable: true
    }
	
	def beforeValidate() {
		if(!prefix){
			prefix = customer.prefix
		}
		if(!code){
			codeNumber = (ProductWish.createCriteria().get {
				projections {
					max "codeNumber"
				}
				eq("prefix", prefix)
			}?:0)+1
			code = prefix + "-" + String.format("%04d",codeNumber)
		}
	}
	
	BigDecimal getTotal(){
		BigDecimal calculatedTotal = BigDecimal.valueOf(0)
		for(item in items){
			calculatedTotal = calculatedTotal.plus(item.total)
		}
		
		return calculatedTotal
	}
	
	BigDecimal getQuantity() {
		BigDecimal calculatedQuantity = BigDecimal.valueOf(0)
		for(item in items){
			calculatedQuantity = calculatedQuantity.plus(item.quantity)
		}
		return calculatedQuantity
	}
	
	BigDecimal getInsurance(){
		return getTotal().plus(freight).multiply(new BigDecimal(0.01))
	}
	
	BigDecimal getTotalNetKilograms(){
		BigDecimal calculatedTotalNetKilograms = BigDecimal.valueOf(0)
		for(item in items){
			calculatedTotalNetKilograms = calculatedTotalNetKilograms.plus(item.totalNetKilograms)
		}
		return calculatedTotalNetKilograms
	}
	
	BigDecimal getTotalGrossKilograms(){
		BigDecimal calculatedGrossWeightPerBox = BigDecimal.valueOf(0)
		for(item in items){
			calculatedGrossWeightPerBox = calculatedGrossWeightPerBox.plus(item.totalGrossKilograms)
		}
		return calculatedGrossWeightPerBox
		
	}
	BigDecimal getTotalVolume(){
		BigDecimal calculatedGrossWeightPerBox = BigDecimal.valueOf(0)
		for(item in items){
			calculatedGrossWeightPerBox = calculatedGrossWeightPerBox.plus(item.totalVolume)
		}
		return calculatedGrossWeightPerBox
	}
	BigDecimal getQuantityOfCartons(){
		BigDecimal calculatedQuantityOfCartons = BigDecimal.valueOf(0)
		for(item in items){
			calculatedQuantityOfCartons = calculatedQuantityOfCartons.plus(item.quantityOfCartons)
		}
		return calculatedQuantityOfCartons
	}
	BigDecimal getTotalVacr(){
		BigDecimal calculatedTotalVacr = BigDecimal.valueOf(0)
		for(item in items){
			calculatedTotalVacr = calculatedTotalVacr.plus(item.totalVacr)
		}
		return calculatedTotalVacr
	}
	
	BigDecimal getContainersByWeight(){
		return getTotalGrossKilograms() / 25500
	}

	BigDecimal getContainersByVolume(){
		return getTotalVolume() / 27
	}
	
}
