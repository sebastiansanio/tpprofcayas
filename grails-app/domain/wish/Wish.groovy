package wish

import stakeholder.*
import modal.*


class Wish {

	
	static hasMany		= [firstStageRequiredDocuments: Document,secondStageRequiredDocuments: Document,picturesOfPrintingBoxes:Picture,picturesOfLoadingContainer:Picture,docDraftToBeApprovedBeforeDelivery:Draft]	
		
	Date dateCreated
	Date lastUpdated
	
	Long opNumber
	Long clientOpNumber
	Customer customer
	Supplier supplier
	Shipper shipper
	
	Load load
	
	String supplierOrder
	PriceCondition priceCondition
	//BigDecimal totalFob
	
	Currency currency
	BigDecimal conversion
	BigDecimal currencyFob
	
	int estimatedDeliveryTerm
	Date estimatedDeliveryDate //Esta fecha se calcula
	Date deliveryDate //Fecha real
	
	Date estimatedTimeOfDeparture 
	Date timeOfDeparture //Fecha real
	
	Date estimatedTimeOfArrival
	Date timeOfArrival //Fecha real
	
	Date wishDate
	Date dateOfMoneyInAdvanceTransfer
	PaymentTerm paymentTerm
	
	WishStatus wishStatus
	PaymentStatus paymentStatus

	CustomsBroker customsBroker
	String customsBrokerRefNumber
	String note

	BigDecimal visaChargePayment
	VisaChargePaymentConcept visaChargePaymentConcept
	
	CriterionValue criterionValue
	boolean licenses
	
	long djaiNumber
	Date formalizationDate
	Date extendedDjai
	
	String cartonPrintingInfo 
	ShippingMark shippingMark
	boolean customerLogoPunch
	
	boolean ciTaxAndCuitVerification
	String hsCodeToBeWritten 
	BigDecimal amountOfMoneyInAdvanceTransferred
	Date swiftSentToSupplierDate
	BigDecimal moneyBalance
	Date dateOfBalancePayment
	boolean picturesOfPrintingBoxesAndLoadReceived
	boolean picturesOfLoadingContainerReveived
	Country sourceCountry
	Port port
	Ship ship
	boolean docDraftApproved
	Forwarder forwarder
	Agent agent
	BigDecimal freightQuote
	String forwarderRefNumber
	
	BigDecimal loadSecuredPercent
	
	BigDecimal cbm
	BigDecimal grossWeight
	BigDecimal netWeight
	int palletsQuantity
	TypeOfFreight typeOfFreight
	
	long blNumber
	long dispatchNumber
	long bill
	
    static mapping = {
    }
    
	static constraints = {
		estimatedDeliveryDate nullable:true
	}
	
	
	
//	public String toString() {
//		return "${name}";
//	}
}
