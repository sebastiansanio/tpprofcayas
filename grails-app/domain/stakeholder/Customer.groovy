package stakeholder

import java.math.BigDecimal;

import modal.Country
import wish.Wish

import org.hibernate.envers.Audited

import product.Family;
import product.PriceList

@Audited
class Customer extends Stakeholder{

	static final String type = "customer"
	
	String address
	String cuit
	String prefix

	BigDecimal defaultMargin
	
	static hasMany		= [wishes: Wish, margins: CustomerFamilyMargin, priceLists: PriceList]
	
    static mapping = {
    }
    
	static constraints = {
		defaultMargin min:0.0000, scale:4, nullable:false
		prefix nullable: false, blank:false, unique: true
		priceLists validator: { val, obj, errors ->
            if ( val != null && val.size() != 0 ) {
                def lists = [] as Set
    
                val.each { lists.add( it.supplier ) }
    
                if ( val.size() != lists.size() ) {
                    errors.rejectValue("priceLists", "product.priceLists.supplier.repeat" )
                    return false 
                }
            }

            return true
        }

    }
	
	BigDecimal getMargin(Family family){
		return margins.find{it.family.id == family.id}?.margin?:defaultMargin
	}
	
	def beforeValidate(){
		if(!defaultMargin){
			defaultMargin = BigDecimal.valueOf(0)
		}
	}
	
}
