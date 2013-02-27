package wish

import java.io.OutputStream;
import java.util.Date;

import login.User
import modal.Country;
import modal.CriterionValue;
import modal.Port;
import modal.Ship;
import modal.ShippingMark;
import modal.TypeOfFreight
import org.springframework.context.MessageSource
import stakeholder.*
import org.springframework.context.MessageSource
import org.springframework.context.MessageSourceAware


class WishExportService implements MessageSourceAware {

    static transactional = true
	def exportService
	MessageSource messageSource
	
	def getFields(Supplier supplier){
		List fields = ["opNumber","customer","supplier","shipper","supplierOrder","currencyFob","currency","estimatedDeliveryDate","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","visaChargePayment","visaChargePaymentConcept","shippingMark","customerLogoPunch","hsCodeToBeWritten",
			"amountOfMoneyInAdvanceTransferred","moneyBalance","dateOfBalancePayment","picturesOfPrintingBoxesAndLoadReceived","picturesOfLoadingContainerReceived","sourceCountry","port",
			"ship","docDraftApproved","cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber"
		]
	}
	
	def getFields(CustomsBroker customsBroker){
		List fields = ["opNumber","customer","shipper","supplierOrder","priceCondition","currencyFob","estimatedTimeOfDeparture",
			"timeOfDeparture","estimatedTimeOfArrival","timeOfArrival","customsBroker","customsBrokerRefNumber","djaiNumber",
			"djaiFormalizationDate","shippingMark","ship","freightQuote","forwarderRefNumber","loadSecuredPercent",
			"cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber","dispatchNumber"
		]
	}
	
	
	def getFields(Customer customer){
		List fields = ["customerOpNumber","customer","shipper","supplierOrder","currencyFob","estimatedDeliveryDate","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
			"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","djaiNumber","djaiFormalizationDate","amountOfMoneyInAdvanceTransferred","moneyBalance","dateOfBalancePayment",
			"port",	"ship","forwarder","freightQuote","forwarderRefNumber","typeOfFreight","blNumber"
		]
	}
	
	def exportWishByStakeholder(String format,OutputStream outputStream,Locale locale,def stakeholder){
		List fields = getFields(stakeholder)
		List wishes = new ArrayList()
		wishes.addAll(stakeholder.wishes)
		
		doExport(format,outputStream,locale,fields,wishes)
	}
	
	def exportWish(String format,OutputStream outputStream,Locale locale) {
		List fields = ["opNumber","customerOpNumber","customer","supplier","shipper","supplierOrder","priceCondition","currencyFob","currency","conversion",
			"foreignCurrencyFob","estimatedDeliveryDate","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
			"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","criterionValue","licenses",
			"djaiNumber","djaiFormalizationDate","djaiExpirationDate","djaiExtendedRequested","djaiExtendedExpiration",
			"shippingMark","customerLogoPunch","taxRegistryNumberAndCuitVerification","hsCodeToBeWritten",
			"amountOfMoneyInAdvanceTransferred","swiftReceivedDate","swiftSentToSupplierDate","moneyBalance","dateOfBalancePayment",
			"picturesOfPrintingBoxesAndLoadReceived","picturesOfLoadingContainerReceived","sourceCountry","port",
			"ship","docDraftApproved","forwarder","agent","freightQuote","forwarderRefNumber","loadSecuredPercent",
			"cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber","dispatchNumber","bill",
			"billDate","finnishDate"
		]
		List wishes = Wish.list()
		doExport(format,outputStream,locale,fields,wishes)
	}
	
	def doExport(String format,OutputStream outputStream,Locale locale,List fields,List wishes){
		
		
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}

		Map labels = new HashMap()
		Map formatters = new HashMap()
		
		def wishDomainClass = new Wish().domainClass

		fields.each{
			labels.put(it, messageSource.getMessage("wish."+it+".label",null,locale))
			if(wishDomainClass.getPropertyByName(it).type == Date)
				formatters.put(it, dateFormatter)
		}
		
		System.out.println(formatters.toString())	
		
		
		Map parameters = [title: messageSource.getMessage("wish.label",null,locale)]
		exportService.export(format,outputStream,wishes,fields,labels,formatters,parameters)
	}

}
