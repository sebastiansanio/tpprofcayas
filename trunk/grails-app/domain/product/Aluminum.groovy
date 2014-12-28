package product

import org.hibernate.envers.Audited
import stakeholder.*
import stakeholder.Customer
import stakeholder.Supplier

@Audited
class Aluminum extends AbstractProduct {
        
    static hasMany      = [ moldCustomer:Customer, originalPlaneSupplier:Supplier ] 

    String      		cayasCode

    AluminumPicture     picture
    AluminumPicture     plane

    Temple      		temple
    Finish      		finish

    Integer     		originalPlane
    Integer     		mold

    BigDecimal  		sectionalL
    BigDecimal  		sectionalW
    BigDecimal  		externalProfileL
    BigDecimal  		externalProfileW

    BigDecimal  		length
    BigDecimal  		theoricalWeight
    BigDecimal  		realWeight

    Integer     		pcsBundle

    Integer     		articlesPerContainer
	
	BigDecimal			volumenPerBox

    static constraints = {
        cayasCode blank:false, unique:true
        originalPlane nullable:true, inList:[1,2]
        mold nullable:true, inList:[1,2,3]
		picture nullable:true
		plane nullable:true
		temple nullable:true
		finish nullable:true
		sectionalL min:0.0000, scale:4, nullable:true
		sectionalW min:0.0000, scale:4, nullable:true
		externalProfileL min:0.0000, scale:4, nullable:true
		externalProfileW min:0.0000, scale:4, nullable:true
		length min:0.0000, scale:4
		theoricalWeight min:0.0000, scale:4
		realWeight min:0.0000, scale:4, nullable:true
		pcsBundle min:1
		articlesPerContainer min:0, nullable:true
		volumenPerBox min:0.0000, scale:4, nullable:true
    }
    
    def getWeightPCS() {
        return length * theoricalWeight
    }
	
	def getCBMPerBundle() {
		return sectionalW/1000 * sectionalL/1000 * length
	}
	
	def getTheoreticalWeightOfPerBundle() {
		return weightPCS * pcsBundle
	}
	
	def moldRemoveElements() {
		if ( mold == 2 )
			return
			
		while ( moldCustomer?.size() > 0 ) {
			removeFromMoldCustomer( moldCustomer.first() )
		}
	}
	
	def originalPlaneRemoveElements() {
		if ( originalPlane == 2 )
			return
		
		while ( originalPlaneSupplier?.size() > 0 ) {
			removeFromOriginalPlaneSupplier( originalPlaneSupplier.first() )
		}
	}
	
	def beforeInsert() {
		moldRemoveElements()
		originalPlaneRemoveElements()
		addHistoricalPriceNewInstance()
	}
	
	def beforeUpdate() {
		moldRemoveElements()
		originalPlaneRemoveElements()
	}
}
