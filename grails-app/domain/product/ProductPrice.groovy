package product

import org.hibernate.envers.Audited

@Audited
class ProductPrice {

    static hasMany = [previousPrices: HistoricalPrice]
    static belongsTo = [list: PriceList]

    List            previousPrices

    Product         product
    BigDecimal      price
	Date	        dateCreated
	Date	        lastUpdated

	static constraints = {
        price min:0.0000, scale:4
    }
	
	@Override
	public String toString() {
		return "${price}"
	}
   
    def getPreviousPrice() {
        return ( previousPrices?.size() == 0 )? null : previousPrices?.last()?.price
    }
    
    def addHistoricalPrice() {
        if ( price != null && previousPrice != price ) {
            this.addToPreviousPrices( new HistoricalPrice( price: price, dateFrom: new Date() ) )
        }
    }

    def beforeInsert() {
        addHistoricalPrice()
    }
    def beforeUpdate() {
        addHistoricalPrice()
    }  
}
