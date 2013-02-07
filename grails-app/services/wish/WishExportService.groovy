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
	
	
	def exportWishByStakeholder(String format,OutputStream outputStream,Locale locale,def stakeholder){
		List fields = ["opNumber","customerOpNumber","customer","supplier","shipper","supplierOrder","priceCondition","currency","conversion",
			"currencyFob","estimatedDeliveryDate","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
			"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","criterionValue","licenses",
			"djaiNumber","djaiFormalizationDate","djaiExtendedRequested","djaiExtendedExpiration",
			"shippingMark","customerLogoPunch","taxRegistryNumberAndCuitVerification","hsCodeToBeWritten",
			"amountOfMoneyInAdvanceTransferred","swiftSentToSupplierDate","moneyBalance","dateOfBalancePayment",
			"picturesOfPrintingBoxesAndLoadReceived","picturesOfLoadingContainerReceived","sourceCountry","port",
			"ship","docDraftApproved","forwarder","agent","freightQuote","forwarderRefNumber","loadSecuredPercent",
			"cbm","grossWeight","netWeight","palletsQuantity","typeOfFreight","blNumber","dispatchNumber","bill",
			"billDate","finnishDate"
		]
		List wishes = new ArrayList()
		wishes.addAll(stakeholder.wishes)
		
		doExport(format,outputStream,locale,fields,wishes)
	}
	
	def exportWish(String format,OutputStream outputStream,Locale locale) {
		List fields = ["opNumber","customerOpNumber","customer","supplier","shipper","supplierOrder","priceCondition","currency","conversion",
			"currencyFob","estimatedDeliveryDate","deliveryDate","estimatedTimeOfDeparture","timeOfDeparture","estimatedTimeOfArrival","timeOfArrival",
			"wishDate","dateOfMoneyInAdvanceTransfer","paymentTerm","wishStatus","paymentStatus","customsBroker",
			"customsBrokerRefNumber","visaChargePayment","visaChargePaymentConcept","criterionValue","licenses",
			"djaiNumber","djaiFormalizationDate","djaiExtendedRequested","djaiExtendedExpiration",
			"shippingMark","customerLogoPunch","taxRegistryNumberAndCuitVerification","hsCodeToBeWritten",
			"amountOfMoneyInAdvanceTransferred","swiftSentToSupplierDate","moneyBalance","dateOfBalancePayment",
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
		Map formatters = ["estimatedDeliveryDate":dateFormatter,"deliveryDate":dateFormatter,"estimatedTimeOfDeparture":dateFormatter,"timeOfDeparture":dateFormatter,
			"wishDate":dateFormatter,"dateOfMoneyInAdvanceTransfer":dateFormatter,"djaiFormalizationDate":dateFormatter,
			"djaiExtendedRequested":dateFormatter,"djaiExtendedExpiration":dateFormatter,"taxRegistryNumberAndCuitVerification":dateFormatter,
			"dateOfBalancePayment":dateFormatter,"picturesOfPrintingBoxesAndLoadReceived":dateFormatter,"picturesOfLoadingContainerReceived":dateFormatter,
			"docDraftApproved":dateFormatter,"billDate":dateFormatter,"finnishDate":dateFormatter]
		
		Map labels = new HashMap()
		
		fields.each{
			labels.put(it, messageSource.getMessage("wish."+it+".label",null,locale))
		}
		
		Map parameters = [title: messageSource.getMessage("wish.label",null,locale)]
		exportService.export(format,outputStream,wishes,fields,labels,formatters,parameters)
	}

}