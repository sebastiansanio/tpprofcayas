package wish

import stakeholder.*
import modal.*
import alert.Alert
import alert.AlertType

class Wish {

	Date dateCreated
	Date lastUpdated
	
	static hasMany		= [alerts: Alert,notes: Note,firstStageRequiredDocuments: Document,secondStageRequiredDocuments: Document,picturesOfPrintingBoxes:Picture,picturesOfLoadingContainer:Picture,docDraftToBeApprovedBeforeDelivery:Draft]	
	
	Long opNumber
	Long customerOpNumber
	Customer customer
	Supplier supplier
	Shipper shipper
	
	Load load
	
	String supplierOrder
	PriceCondition priceCondition
	
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

	CustomsBroker customsBroker
	String customsBrokerRefNumber

	BigDecimal visaChargePayment
	VisaChargePaymentConcept visaChargePaymentConcept
	
	CriterionValue criterionValue
	boolean licenses
	
	long djaiNumber
	Date formalizationDate
	Date extendedDjai
	Date getDjaiExpirationDate(){
		
		return formalizationDate+180
	}
	
	
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
		opNumber unique:true
		customerOpNumber unique: 'customer'
		customer nullable:false
		supplier nullable:false
		shipper nullable:false
		supplierOrder nullable:true,blank:true
		priceCondition nullable:true
		currency nullable:true
		conversion nullable:true
		currencyFob nullable:true
		estimatedDeliveryTerm nullable:true
		estimatedDeliveryDate nullable:true
		deliveryDate nullable:true
		estimatedTimeOfDeparture nullable:true
		timeOfDeparture nullable:true
		estimatedTimeOfArrival nullable:true
		timeOfArrival nullable:true
		wishDate nullable:false
		dateOfMoneyInAdvanceTransfer nullable:true
		paymentTerm nullable:true
		wishStatus nullable:true
		paymentStatus nullable:true
		customsBroker nullable:true
		customsBrokerRefNumber nullable:true,blank:true
		visaChargePayment nullable:true
		visaChargePaymentConcept nullable:true,blank:true
		criterionValue nullable:true
		licenses nullable:false
		djaiNumber nullable:false,blank:false
		formalizationDate nullable:false
		extendedDjai nullable:true
		cartonPrintingInfo nullable:true,blank:true
		shippingMark nullable:true
		customerLogoPunch nullable:true
		ciTaxAndCuitVerification nullable:true
		hsCodeToBeWritten nullable:true,blank:true
		amountOfMoneyInAdvanceTransferred nullable:true
		swiftSentToSupplierDate nullable:true
		moneyBalance nullable:true
		dateOfBalancePayment nullable:true
		picturesOfPrintingBoxesAndLoadReceived nullable:true
		picturesOfLoadingContainerReveived nullable:true
		sourceCountry nullable:true
		port nullable:true
		ship nullable:true
		docDraftApproved nullable:true
		forwarder nullable:true
		agent nullable:true
		freightQuote nullable:true
		forwarderRefNumber blank:true,nullable:true
		loadSecuredPercent nullable:true
		cbm nullable:true
		grossWeight nullable:true
		netWeight nullable:true
		palletsQuantity nullable:true
		typeOfFreight nullable:true
		blNumber nullable:true
		dispatchNumber nullable:true
		bill nullable:true		
		load nullable:true
	}
	
	def getActiveAlerts(){
		return alerts.findAll().findAll{
			it.isActive()
		}
	}
	
	boolean isActive(){
		return true
	}
		
	Date getDate(String dateField){
		return this[dateField]
		
	}
	
	void generateAlert(AlertType alertType,Date deadline){
		def activeAlerts = getActiveAlerts()
		if(!(alertType.id in activeAlerts.alertType.id))
			addToAlerts(new Alert(alertType:alertType,deadline:deadline))
	}
	
//	public String toString() {
//		return "${name}";
//	}
}
