package wish

import stakeholder.*
import modal.*


class Wish {

	
	static hasMany		= [firstStageRequiredDocuments: Document,secondStageRequiredDocuments: Document,picturesOfPrintingBoxes:Picture,picturesOfLoadingContainer:Picture,docDraftToBeApprovedBeforeDelivery:Draft]	
	
	
	Date dateCreated
	Date lastUpdated
	
	Long opNumber
	Stakeholder customer
	Stakeholder supplier
	Stakeholder shipper
	Load load
	String supplierOrder
	PriceCondition priceCondition
	BigDecimal totalFob
	Currency currency
	BigDecimal conversion
	BigDecimal currencyFob
	
	int estimatedDeliveryTerm
	Date estimatedDeliveryDate
	Date deliveryDate
	
	Date estimatedTimeOfDeparture
	Date timeOfDeparture
	
	Date estimatedTimeOfArrival
	Date timeOfArrival
	
	Date wishDate
	Date dateOfMoneyInAdvanceTransfer
	PaymentTerm paymentTerm
	WishStatus wishStatus
	PaymentStatus paymentStatus

	Stakeholder customsBroker
	String customsBrokerRefNumber
	String note

	BigDecimal visaChargePayment
	CriterionValue criterionValue
	boolean licenses
	Date djaiPresentedDate
	
	String cartonPrintingInfo 
	ShippingMark shippingMark
	String customerLogoPunch //TODO
	String ciTaxAndCuitVerification //TODO
	String hsCodeToBeWritten 
	BigDecimal amountOfMoneyInAdvanceTransferred
	Date swiftSentToSupplierDate
	BigDecimal moneyBalance
	Date dateOfBalancePayment
	boolean picturesOfPrintingBoxesAndLoadReceived //TODO
	boolean picturesOfLoadingContainerReveived //TODO
	Country sourceCountry
	Port port
	Ship ship
	boolean docDraftApproved
	Stakeholder forwarder
	Stakeholder agent
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
