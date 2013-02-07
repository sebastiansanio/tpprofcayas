package wish

import stakeholder.*
import modal.*
import alert.Alert
import alert.AlertType

class Wish {

	static hasMany		= [loadUnits: LoadUnit, alerts: Alert,notes: Note,firstStageRequiredDocuments: Document,secondStageRequiredDocuments: Document,picturesOfPrintingBoxes:Picture,picturesOfLoadingContainer:Picture,docDraftToBeApprovedBeforeDelivery:Draft]
	
	List loadUnits
	List notes
	List firstStageRequiredDocuments
	List secondStageRequiredDocuments
	List picturesOfPrintingBoxes
	List picturesOfLoadingContainer
	List docDraftToBeApprovedBeforeDelivery
	
	Date dateCreated
	Date lastUpdated
	Long opNumber
	Long customerOpNumber
	Customer customer
	Supplier supplier
	Shipper shipper
	String supplierOrder
	PriceCondition priceCondition
	Currency currency
	BigDecimal conversion
	BigDecimal currencyFob
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
	Date djaiFormalizationDate
	Date djaiExtendedRequested
	Date djaiExtendedExpiration
	ShippingMark shippingMark
	boolean customerLogoPunch
	Date taxRegistryNumberAndCuitVerification
	String hsCodeToBeWritten 
	BigDecimal amountOfMoneyInAdvanceTransferred
	Date swiftSentToSupplierDate
	BigDecimal moneyBalance
	Date dateOfBalancePayment
	Date picturesOfPrintingBoxesAndLoadReceived
	Date picturesOfLoadingContainerReceived
	Country sourceCountry
	Port port
	Ship ship
	Date docDraftApproved
	Forwarder forwarder
	Agent agent
	BigDecimal freightQuote
	String forwarderRefNumber
	BigDecimal loadSecuredPercent
	BigDecimal cbm
	BigDecimal grossWeight
	BigDecimal netWeight
	Integer palletsQuantity
	TypeOfFreight typeOfFreight
	String blNumber
	String dispatchNumber
	String bill
	Date billDate
	Date finnishDate
	
    
	static constraints = {
		opNumber unique:true,min:0L
		customerOpNumber unique: 'customer',min:0L
		customer nullable:false
		supplier nullable:false
		shipper nullable:true
		supplierOrder nullable:true,blank:true
		priceCondition nullable:true
		currency nullable:true
		conversion nullable:false,min:0.0
		currencyFob nullable:false
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
		djaiFormalizationDate nullable:false
		djaiExtendedRequested nullable:true
		djaiExtendedExpiration nullable:true
		shippingMark nullable:true
		customerLogoPunch nullable:true
		taxRegistryNumberAndCuitVerification nullable:true	
		hsCodeToBeWritten nullable:true,blank:true
		amountOfMoneyInAdvanceTransferred nullable:true
		swiftSentToSupplierDate nullable:true
		moneyBalance nullable:true
		dateOfBalancePayment nullable:true
		picturesOfPrintingBoxesAndLoadReceived nullable:true
		picturesOfLoadingContainerReceived nullable:true
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
		billDate nullable:true
		finnishDate nullable:true
	}
	
	def getActiveAlerts(){
		return alerts.findAll().findAll{
			it.isActive()
		}
	}
	
	boolean isActive(){
		return finnishDate == null
	}
		
	BigDecimal getForeignCurrencyFob(){
		return currencyFob.divide(conversion)
	}
	
	
	Date getDjaiExpirationDate(){
		return djaiFormalizationDate+180
	}
	
	void generateAlert(AlertType alertType,Date deadline){
		def activeAlerts = getActiveAlerts()
		if(!(alertType.id in activeAlerts.alertType.id))
			addToAlerts(new Alert(alertType:alertType,deadline:deadline,checked:false))
	}
	
	public String toString() {
		return opNumber
	}
}
