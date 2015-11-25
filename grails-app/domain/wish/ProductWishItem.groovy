package wish

import java.math.BigDecimal;

import modal.Country;
import modal.PriceCondition

import org.hibernate.envers.Audited

import product.Color
import product.ItemUnit;
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
		return quantity.multiply(unitPrice).setScale(4)
	}
	
	String getDescriptionSP(){
		return product.descriptionSP
	}
	
	String getDescriptionEN(){
		return product.descriptionEN
	}
	
	Color getColor(){
		return product.color
	}
	String getCustomerCode(){
		return product.retrieveCodeByCustomer(wish.customer)
	}
	
	ItemUnit getItemUnit(){
		return product.ItemUnit
	}
	
	Currency getCurrency(){
		return product.currency
	}
	
	PriceCondition getPriceCondition(){
		return product.priceCondition
	}
	
	Country getCountryOfOrigin(){
		return wish.countryOfOrigin
	}
	Country getCountryOfProcedence(){
		return wish.countryOfProcedence
	}
	
	BigDecimal getCriterionValue(){
		return product.criterionValue
	}
	
	BigDecimal getValuePerKilo(){
		return unitPrice.multiply(product.quantityPerCarton).divide(product.netWeightPerBox).setScale(2)
	}
	
	String getHsCode(){
		return product.hsCode
	}
	
	BigDecimal getTax(){
		return product.tax
	}
	BigDecimal getQuantityPerCarton(){
		return quantityPerCarton
	}
	BigDecimal getNetWeightPerBox(){
		return product.netWeightPerBox
	}
	BigDecimal getGrossWeightPerBox(){
		return product.grossWeightPerBox
	}
	BigDecimal getVolumePerBox(){
		return product.outerBoxVolume
	}
	BigDecimal getTotalNetKilograms(){
		return quantity.multiply(product.netWeightPerBox).divide(quantityPerCarton).setScale(2)
	}
	BigDecimal getTotalGrossKilograms(){
		return quantity.multiply(product.grossWeightPerBox).divide(quantityPerCarton).setScale(2)
	}
	BigDecimal getTotalVolume(){
		return quantity.multiply(product.outerBoxVolume).divide(quantityPerCarton).setScale(2)
	}
	BigDecimal getQuantityOfCartons(){
		return quantity.divide(quantityPerCarton)
	}
	BigDecimal getTotalVacr(){
		return getTotalNetKilograms()*product.tax
	}
}
