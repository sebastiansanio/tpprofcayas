package wish

import stakeholder.*


class Wish {

	Date dateCreated
	Date lastUpdated
	
	Long opNumber
	Stakeholder customer
	Stakeholder supplier
	Stakeholder shipper
	String artDescription
	String supplierOrder
	PriceCondition priceCondition
	BigDecimal totalFob
	Currency currency
	BigDecimal conversion
	BigDecimal currencyFob
	Date deliveryDate
	Date estimatedTimeOfDeparture
	Date estimatedTimeOfArrival
	Date wishDate
	
	Stakeholder fordwarder
	String note
	Load load
	
    static mapping = {
    }
    
	static constraints = {
    	customer nullable:false
		supplier nullable:true
		shipper nullable: true
		load nullable: true
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
