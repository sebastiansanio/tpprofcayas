
<%@ page import="wish.Wish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-wish" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.opNumber.label" default="Op Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "opNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customerOpNumber.label" default="Customer Op Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "customerOpNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customer.label" default="Customer" /></td>
				
				<td valign="top" class="value"><g:link controller="customer" action="show" id="${wishInstance?.customer?.id}">${wishInstance?.customer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.supplier.label" default="Supplier" /></td>
				
				<td valign="top" class="value"><g:link controller="supplier" action="show" id="${wishInstance?.supplier?.id}">${wishInstance?.supplier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.shipper.label" default="Shipper" /></td>
				
				<td valign="top" class="value"><g:link controller="shipper" action="show" id="${wishInstance?.shipper?.id}">${wishInstance?.shipper?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.supplierOrder.label" default="Supplier Order" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.priceCondition.label" default="Price Condition" /></td>
				
				<td valign="top" class="value"><g:link controller="priceCondition" action="show" id="${wishInstance?.priceCondition?.id}">${wishInstance?.priceCondition?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.currency.label" default="Currency" /></td>
				
				<td valign="top" class="value"><g:link controller="currency" action="show" id="${wishInstance?.currency?.id}">${wishInstance?.currency?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.conversion.label" default="Conversion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "conversion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.currencyFob.label" default="Currency Fob" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "currencyFob")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.estimatedDeliveryTerm.label" default="Estimated Delivery Term" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "estimatedDeliveryTerm")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.estimatedDeliveryDate.label" default="Estimated Delivery Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.estimatedDeliveryDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.deliveryDate.label" default="Delivery Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.deliveryDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.estimatedTimeOfDeparture.label" default="Estimated Time Of Departure" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.estimatedTimeOfDeparture}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.timeOfDeparture.label" default="Time Of Departure" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.timeOfDeparture}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.estimatedTimeOfArrival.label" default="Estimated Time Of Arrival" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.estimatedTimeOfArrival}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.timeOfArrival.label" default="Time Of Arrival" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.timeOfArrival}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.wishDate.label" default="Wish Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.wishDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateOfMoneyInAdvanceTransfer.label" default="Date Of Money In Advance Transfer" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateOfMoneyInAdvanceTransfer}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.paymentTerm.label" default="Payment Term" /></td>
				
				<td valign="top" class="value"><g:link controller="paymentTerm" action="show" id="${wishInstance?.paymentTerm?.id}">${wishInstance?.paymentTerm?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.wishStatus.label" default="Wish Status" /></td>
				
				<td valign="top" class="value"><g:link controller="wishStatus" action="show" id="${wishInstance?.wishStatus?.id}">${wishInstance?.wishStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.paymentStatus.label" default="Payment Status" /></td>
				
				<td valign="top" class="value"><g:link controller="paymentStatus" action="show" id="${wishInstance?.paymentStatus?.id}">${wishInstance?.paymentStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customsBroker.label" default="Customs Broker" /></td>
				
				<td valign="top" class="value"><g:link controller="customsBroker" action="show" id="${wishInstance?.customsBroker?.id}">${wishInstance?.customsBroker?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customsBrokerRefNumber.label" default="Customs Broker Ref Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "customsBrokerRefNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.visaChargePayment.label" default="Visa Charge Payment" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "visaChargePayment")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.visaChargePaymentConcept.label" default="Visa Charge Payment Concept" /></td>
				
				<td valign="top" class="value"><g:link controller="visaChargePaymentConcept" action="show" id="${wishInstance?.visaChargePaymentConcept?.id}">${wishInstance?.visaChargePaymentConcept?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.criterionValue.label" default="Criterion Value" /></td>
				
				<td valign="top" class="value"><g:link controller="criterionValue" action="show" id="${wishInstance?.criterionValue?.id}">${wishInstance?.criterionValue?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.licenses.label" default="Licenses" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.licenses}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiNumber.label" default="Djai Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "djaiNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.formalizationDate.label" default="Formalization Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.formalizationDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.extendedDjai.label" default="Extended Djai" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.extendedDjai}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.cartonPrintingInfo.label" default="Carton Printing Info" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "cartonPrintingInfo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.shippingMark.label" default="Shipping Mark" /></td>
				
				<td valign="top" class="value"><g:link controller="shippingMark" action="show" id="${wishInstance?.shippingMark?.id}">${wishInstance?.shippingMark?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customerLogoPunch.label" default="Customer Logo Punch" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.customerLogoPunch}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.ciTaxAndCuitVerification.label" default="Ci Tax And Cuit Verification" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.ciTaxAndCuitVerification}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.hsCodeToBeWritten.label" default="Hs Code To Be Written" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "hsCodeToBeWritten")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.amountOfMoneyInAdvanceTransferred.label" default="Amount Of Money In Advance Transferred" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "amountOfMoneyInAdvanceTransferred")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.swiftSentToSupplierDate.label" default="Swift Sent To Supplier Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.swiftSentToSupplierDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.moneyBalance.label" default="Money Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "moneyBalance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateOfBalancePayment.label" default="Date Of Balance Payment" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateOfBalancePayment}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfPrintingBoxesAndLoadReceived.label" default="Pictures Of Printing Boxes And Load Received" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.picturesOfPrintingBoxesAndLoadReceived}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.aapicturesOfPrintingBoxes.label" default="Pictures Of Printing Boxes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<g:link class="btn btn-primary" action="viewPhotoBoxes" id="${wishInstance.id}">Ver fotos</g:link>
					<ul>
					<g:each in="${wishInstance.picturesOfPrintingBoxes}" var="p">
						<li><g:link controller="picture" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainerReveived.label" default="Pictures Of Loading Container Reveived" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.picturesOfLoadingContainerReveived}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainer.label" default="Pictures Of Loading Container" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<g:link class="btn btn-primary" action="viewPhotoContainer" id="${wishInstance.id}">Ver fotos</g:link>
					<ul>
					<g:each in="${wishInstance.picturesOfLoadingContainer}" var="p">
						<li><g:link controller="picture" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
				
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.sourceCountry.label" default="Source Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${wishInstance?.sourceCountry?.id}">${wishInstance?.sourceCountry?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.port.label" default="Port" /></td>
				
				<td valign="top" class="value"><g:link controller="port" action="show" id="${wishInstance?.port?.id}">${wishInstance?.port?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.ship.label" default="Ship" /></td>
				
				<td valign="top" class="value"><g:link controller="ship" action="show" id="${wishInstance?.ship?.id}">${wishInstance?.ship?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.docDraftApproved.label" default="Doc Draft Approved" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.docDraftApproved}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.forwarder.label" default="Forwarder" /></td>
				
				<td valign="top" class="value"><g:link controller="forwarder" action="show" id="${wishInstance?.forwarder?.id}">${wishInstance?.forwarder?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.agent.label" default="Agent" /></td>
				
				<td valign="top" class="value"><g:link controller="agent" action="show" id="${wishInstance?.agent?.id}">${wishInstance?.agent?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.freightQuote.label" default="Freight Quote" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "freightQuote")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.forwarderRefNumber.label" default="Forwarder Ref Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "forwarderRefNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.loadSecuredPercent.label" default="Load Secured Percent" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "loadSecuredPercent")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.cbm.label" default="Cbm" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "cbm")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.grossWeight.label" default="Gross Weight" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "grossWeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.netWeight.label" default="Net Weight" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "netWeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.palletsQuantity.label" default="Pallets Quantity" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "palletsQuantity")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.typeOfFreight.label" default="Type Of Freight" /></td>
				
				<td valign="top" class="value"><g:link controller="typeOfFreight" action="show" id="${wishInstance?.typeOfFreight?.id}">${wishInstance?.typeOfFreight?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.blNumber.label" default="Bl Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "blNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dispatchNumber.label" default="Dispatch Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "dispatchNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.bill.label" default="Bill" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "bill")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.load.label" default="Load" /></td>
				
				<td valign="top" class="value"><g:link controller="load" action="show" id="${wishInstance?.load?.id}">${wishInstance?.load?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishInstance.docDraftToBeApprovedBeforeDelivery}" var="d">
						<li><g:link controller="draft" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.firstStageRequiredDocuments.label" default="First Stage Required Documents" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishInstance.firstStageRequiredDocuments}" var="f">
						<li><g:link controller="document" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.notes.label" default="Notes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishInstance.notes}" var="n">
						<li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.secondStageRequiredDocuments.label" default="Second Stage Required Documents" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishInstance.secondStageRequiredDocuments}" var="s">
						<li><g:link controller="document" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
