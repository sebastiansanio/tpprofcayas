package wish

import stakeholder.*
import modal.*


class Wish {

	Date dateCreated
	Date lastUpdated
	
	Long opNumber
	Stakeholder customer
	Stakeholder supplier
	Stakeholder shipper
	String artDescription //TODO
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
	Date dateOfMoneyInAdvanceTransfer
	PaymentTerm paymentTerm
	WishStatus wishStatus
	PaymentStatus paymentStatus
	String requiredDocuments //TODO
	Stakeholder customsBroker
	String customsBrokerRefNumber
	String note
	String afipRequirement //TODO
	String visaChargePayment //TODO
	String criterionValue //TODO
	String licenses //TODO
	String djaiStatus //TODO
	String djaiPresented //TODO
	String cartonPrintingInfo //TODO
	String shippingMarks //TODO
	String customerLogoPunch //TODO
	String ciTaxAndCuitVerification //TODO
	String hsCodeToBeWritter //TODO
	BigDecimal amountOfMoneyInAdvanceTransferred
	Date swiftSentToSupplier //TODO
	BigDecimal moneyBalance
	Date dateOfBalancePayment
	String picturesOfPrintingBoxesAndLoad //TODO
	String picturesOfLoadingContainer //TODO
	Country sourceCountry
	Port port
	String shipName //TODO
	String docDraftToBeApprovedBeforeDelivery //TODO
	Stakeholder forwarder
	Stakeholder agent
	BigDecimal freightQuote
	String forwarderRefNumber
	BigDecimal loadSecuredPercent
	BigDecimal cbm
	BigDecimal grossWeight
	int palletsQuantity
	String typeOfFreight //TODO
	String previousDocumentationCopy //TODO
	String documentatioStatus //TODO
	String blNumber //TODO
	String dispatchNumber //TODO
	long bill
	
    static mapping = {
    }
    
	static constraints = {
		
	}
	
//	public String toString() {
//		return "${name}";
//	}
}
