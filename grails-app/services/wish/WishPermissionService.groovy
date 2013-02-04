package wish

import java.math.BigDecimal;
import java.util.Date;

import modal.Country;
import modal.CriterionValue;
import modal.Port;
import modal.Ship;
import modal.ShippingMark;
import modal.TypeOfFreight;
import stakeholder.Agent;
import stakeholder.CustomsBroker;
import stakeholder.Forwarder;

class WishPermissionService {

    static transactional = true

    def getFields() {
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
		
		return fields

    }
	
	def getFormatters(){
		
		def dateFormatter = {domain, value->
			return value?.format("dd/MM/yyyy")
		}
		Map formatters = ["estimatedDeliveryDate":dateFormatter,"deliveryDate":dateFormatter,"estimatedTimeOfDeparture":dateFormatter,"timeOfDeparture":dateFormatter,
			"wishDate":dateFormatter,"dateOfMoneyInAdvanceTransfer":dateFormatter,"djaiFormalizationDate":dateFormatter,
			"djaiExtendedRequested":dateFormatter,"djaiExtendedExpiration":dateFormatter,"taxRegistryNumberAndCuitVerification":dateFormatter,
			"dateOfBalancePayment":dateFormatter,"picturesOfPrintingBoxesAndLoadReceived":dateFormatter,"picturesOfLoadingContainerReceived":dateFormatter,
			"docDraftApproved":dateFormatter,"billDate":dateFormatter,"finnishDate":dateFormatter]
		
		return formatters
	}
}
