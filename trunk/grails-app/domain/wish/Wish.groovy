package wish

import stakeholder.*
import modal.*
import alert.*

import org.hibernate.envers.Audited

@Audited
class Wish {

	static hasMany		= [loadUnits: LoadUnit, alerts: Alert,notes: Note,firstStageRequiredDocuments: FirstStageDocument,secondStageRequiredDocuments: SecondStageDocument,picturesOfPrintingBoxes:PrintingBoxesPicture,picturesOfLoadingContainer:LoadingContainerPicture,docDraftToBeApprovedBeforeDelivery:Draft]
	
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
	String productDescription
	String supplierOrder
	PriceCondition priceCondition
	Currency currency
	BigDecimal conversion
	BigDecimal currencyFob
	Date deliveryDate
	boolean deliveryDateConfirmed
	Date cartonPrintingInfoSentDate	
	Date estimatedTimeOfDeparture 
	boolean departed
	Date estimatedTimeOfArrival
	boolean arrived
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
	String djaiNumber
	Date djaiFormalizationDate
	Date djaiExtendedRequested
	Date djaiExtendedExpiration
	ShippingMark shippingMark
	boolean customerLogoPunch
	Date taxRegistryNumberAndCuitVerification
	String hsCodeToBeWritten 
	BigDecimal amountOfMoneyInAdvanceTransferred
	Date swiftReceivedDate
	Date swiftSentToSupplierDate
	BigDecimal moneyBalance
	Date dateOfBalancePayment
	Date picturesOfPrintingBoxesAndLoadReceived
	boolean picturesOfPrintingBoxesNotReceive
	Date picturesOfLoadingContainerReceived
	boolean picturesOfLoadingContainerNotReceive
	Country sourceCountry
	Port port
	Ship ship
	Date docDraftApproved
	boolean docDraftNotReceive
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
	Date finishDate
	boolean hasFeeder
	Date forwarderSelectedDate
	boolean blCopyReceived
	boolean visaSecondStage
	
	static constraints = {
		opNumber unique:true,min:0L
		customerOpNumber unique: 'customer',min:0L
		customer nullable:false
		supplier nullable:false
		shipper nullable:true
		productDescription nullable:true,blank:true,maxSize:2048
		supplierOrder nullable:true,blank:true
		priceCondition nullable:true
		currency nullable:true
		conversion nullable:true,min:0.0001,scale:4
		currencyFob nullable:true,scale:4
		deliveryDate nullable:true
		cartonPrintingInfoSentDate nullable:true
		estimatedTimeOfDeparture nullable:true
		estimatedTimeOfArrival nullable:true
		wishDate nullable:false
		dateOfMoneyInAdvanceTransfer nullable:true
		paymentTerm nullable:true
		wishStatus nullable:true
		paymentStatus nullable:true
		customsBroker nullable:true
		customsBrokerRefNumber nullable:true,blank:true
		visaChargePayment nullable:true,scale:4
		visaChargePaymentConcept nullable:true,blank:true
		criterionValue nullable:true
		licenses nullable:false
		djaiNumber nullable:true,blank:true
		djaiFormalizationDate nullable:true
		djaiExtendedRequested nullable:true
		djaiExtendedExpiration nullable:true
		shippingMark nullable:true
		customerLogoPunch nullable:true
		taxRegistryNumberAndCuitVerification nullable:true	
		hsCodeToBeWritten nullable:true,blank:true
		amountOfMoneyInAdvanceTransferred nullable:true,scale:4
		swiftReceivedDate nullable:true
		swiftSentToSupplierDate nullable:true
		moneyBalance nullable:true,scale:4
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
		finishDate nullable:true
		forwarderSelectedDate nullable:true
	}
		
	def beforeValidate(){
		if(forwarder!= null && forwarderSelectedDate == null)
			forwarderSelectedDate = new Date().clearTime()
		if(forwarder == null)
			forwarderSelectedDate = null
	}
	
	Date getTimeOfDeparture(){
		if(departed)
			return estimatedTimeOfDeparture
		else
			return null
	}
	
	Date getTimeOfArrival(){
		if(arrived)
			return estimatedTimeOfArrival
		else
			return null
	}
	
	def getActiveAlerts(){
		return alerts.findAll{
			it.isActive()
		}
	}
	

	boolean isActive(){
		return finishDate == null
	}
		
	BigDecimal getForeignCurrencyFob(){
		
		if(currencyFob==null || conversion == null)
			return null
		
		return currencyFob.divide(conversion,4)
	}
	
		
	Date getDjaiExpirationDate(){
		if (djaiFormalizationDate==null)
			return null
		
		return djaiFormalizationDate+180
	}
	

	def checkAlerts(){
		def activeAlerts = getActiveAlerts()
		activeAlerts.each{
			it.check()
		}	
	}
		
	void addAlert(AlertType alertType){
		checkAlerts()
		
		if(!isActive())
			return
		def completionField = this[alertType.nameOfCompletionField]
		if (completionField)
			return
		Date estimatedDate = this[alertType.nameOfEstimatedDateField]
		if (estimatedDate == null)
			return
		Date attentionDate = estimatedDate.minus(alertType.alertTerm)
		def activeAlerts = getActiveAlerts()
				
		if(!(alertType.id in activeAlerts.alertType.id))
			addToAlerts(new Alert(alertType:alertType,deadline:estimatedDate,attentionDate:attentionDate))
	}
		
	//Alert 1
	Date getLastCartonPrintingInfoSentDate(){	
		
		if(cartonPrintingInfoSentDate!=null)
			return cartonPrintingInfoSentDate
			
		boolean dateNull = false
		Date lastCartonPrintingInfoSendDate = null
		loadUnits.each{
			if(it.cartonPrintingInfoSentDate == null)
				dateNull = true		
			else if(lastCartonPrintingInfoSendDate == null || it.cartonPrintingInfoSentDate > lastCartonPrintingInfoSendDate)
				lastCartonPrintingInfoSendDate = it.cartonPrintingInfoSentDate
		}
		if(!dateNull)
			return lastCartonPrintingInfoSendDate
		else
			return null
	}
	

	
	//Alert 2
	Date getDateToConfirmDeliveryDate(){
		if(paymentTerm?.percentPaymentBeforeDelivery == 0)
			return wishDate?.plus(1)
		else
			return dateOfMoneyInAdvanceTransfer
	}
	
	//Alert 3
	Date getDateToDemandSwiftToClient(){
		if(paymentTerm?.percentPaymentBeforeDelivery==30){
			Date date = wishDate
			int i = 0
			while (i<4){
				date = date.plus(1)
				if(!(date[Calendar.DAY_OF_WEEK]==Calendar.SATURDAY || date[Calendar.DAY_OF_WEEK]==Calendar.SUNDAY))
				i++
			}
			return date
		}else if(paymentTerm?.percentPaymentBeforeDelivery!=0){
			return getBlReceivedDate()?.plus(5)
		}
		
		return null
	}
	
	//Alert 5
	Date getConfirmedDeliveryDate(){
		if(deliveryDateConfirmed)
			return deliveryDate
	}
	
	//Alert 6
	Date getRequireVisaFirstStageDate(){
		Date returnDate = null
		for(Document document: firstStageRequiredDocuments){
			if(document.requiresVisa()){
				returnDate = deliveryDate
				break
			}
			
		}
		return returnDate
	}
	
	Date getRequireVisaSecondStageDate(){
		Date returnDate = null
		for(Document document: secondStageRequiredDocuments){
			if(document.requiresVisa()){
				returnDate = estimatedTimeOfDeparture?.plus(20)
				break
			}
			
		}
		return returnDate
	}
	
	Date getVisaFirstStageReceivedDate(){
		Date returnDate = null
		for(Document document:firstStageRequiredDocuments){
			if(document.requiresVisa()){
				if(document.arrivalDate==null){
					returnDate = null
					break
				}else{
					if(returnDate == null || returnDate.compareTo(document.arrivalDate)<0)
						returnDate = document.arrivalDate
				}
			}
		}
		return returnDate
	}
	
	Date getVisaSecondStageReceivedDate(){
		Date returnDate = null
		for(Document document:secondStageRequiredDocuments){
			if(document.requiresVisa()){
				if(document.arrivalDate==null){
					returnDate = null
					break
				}else{
					if(returnDate == null || returnDate.compareTo(document.arrivalDate)<0)
						returnDate = document.arrivalDate
				}
			}
		}
		return returnDate
	}
	
	//Alert 8 - Alert 11
	Date getEstimatedBalancePaymentDate(){
		if(paymentTerm?.percentPaymentAfterDelivery==0)
			return deliveryDate
		if(paymentTerm?.percentPaymentAfterDelivery==100 && paymentTerm?.paymentDaysAfterTimeOfArrival > 0)
			return estimatedTimeOfArrival?.plus(paymentTerm?.paymentDaysAfterTimeOfArrival)
		if(paymentTerm?.percentPaymentAfterDelivery>0)
			return estimatedTimeOfDeparture?.plus(5)
		return null
	}
	
	//Alert 10
	Date getRequireBlDate(){
		boolean requiresBl = false
		firstStageRequiredDocuments.each{
			if(it.isBl())
				requiresBl = true
		}
		
		secondStageRequiredDocuments.each{
			if(it.isBl())
				requiresBl = true
		}
		
		if(!requiresBl)
			return null
				
		Date timeOfDepartureAux = getTimeOfDeparture()
		if(timeOfDepartureAux == null)
			return null
		else
			return timeOfDepartureAux.plus(5)
		
	}
	
	Date getDateToRequirePicturesOfLoadingContainer(){
		if(typeOfFreight?.requiresPicturesOfLoadingContainer)
			return forwarderSelectedDate
		else
			return null
	}
	
	Date getBlReceivedDate(){
		
		Date blReceivedAux = null
		firstStageRequiredDocuments.each{
			if(it.isBl())
				blReceivedAux = it.arrivalDate
		}
		
		secondStageRequiredDocuments.each{
			if(it.isBl())
				blReceivedAux = it.arrivalDate
		}
		return blReceivedAux
	}
	
	boolean isPending(){
		return billDate == null && finishDate == null
	}
	
	
	public String toString() {
		return opNumber
	}
	
	Date getPicturesOfPrintingBoxesAndLoadFinished(){
		return picturesOfPrintingBoxesNotReceive?wishDate:picturesOfPrintingBoxesAndLoadReceived
	}
	Date getPicturesOfLoadingContainerFinished(){
		return picturesOfLoadingContainerNotReceive?wishDate:picturesOfLoadingContainerReceived
	}
	Date getDocDraftFinished(){
		return docDraftNotReceive?wishDate:docDraftApproved
	}
	
	Date getOriginalDjaiFinished(){
		return djaiExtendedExpiration?:billDate
	}
	
	boolean getFirstStageDocumentsOngoing(){
		if(firstStageRequiredDocuments==null || firstStageRequiredDocuments.size() == 0)
			return false
		for(document in firstStageRequiredDocuments){
			if(document.received==null && document.courierRecord==null)
				return false
		}
		return true
			
	}

}
