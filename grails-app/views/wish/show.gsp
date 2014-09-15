
<%@ page import="wish.Wish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'noteStyle.css')}" />
</head>

<body>

<section id="show-wish" class="first">

	<h4> <g:message code="wish.title.generalData.label" default="General Data"/> </h4>

	<table class="table">
		<tbody>
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
				<td valign="top" class="name"><g:message code="wish.customsBroker.label" default="Customs Broker" /></td>
				
				<td valign="top" class="value"><g:link controller="customsBroker" action="show" id="${wishInstance?.customsBroker?.id}">${wishInstance?.customsBroker?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.forwarder.label" default="Forwarder" /></td>
				
				<td valign="top" class="value"><g:link controller="forwarder" action="show" id="${wishInstance?.forwarder?.id}">${wishInstance?.forwarder?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.agent.label" default="Agent" /></td>
				
				<td valign="top" class="value"><g:link controller="agent" action="show" id="${wishInstance?.agent?.id}">${wishInstance?.agent?.encodeAsHTML()}</g:link></td>
				
			</tr>
		</tbody>
	</table>
	
	<h4> <g:message code="wish.title.wishStatus.label" default="Wish status"/> </h4>
	
	<table class="table">
		<tbody>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.wishStatus.label" default="Wish Status" /></td>
				
				<td valign="top" class="value"><g:link controller="wishStatus" action="show" id="${wishInstance?.wishStatus?.id}">${wishInstance?.wishStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
		</tbody>
	</table>
	
	<h4> <g:message code="wish.title.reference.label" default="Reference"/> </h4>
	
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
				<td valign="top" class="name"><g:message code="wish.supplierOrder.label" default="Supplier Order" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customsBrokerRefNumber.label" default="Customs Broker Ref Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "customsBrokerRefNumber")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.forwarderRefNumber.label" default="Forwarder Ref Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "forwarderRefNumber")}</td>
				
			</tr>
		</tbody>
	</table>
						
	<h4> <g:message code="wish.activeAlerts.label" default="Active Alerts" /> </h4>	
	
	<table class="table">
		<tbody>
			<tr class="prop">
				<td colspan="2" valign="top" class="name">
                    <ul>
                        <g:each in="${wishInstance.activeAlerts.sort{it.attentionDate}}" var="a">
                         <li class="alert ${(!a.isInspected()) && a?.attentionDate.compareTo(new Date().clearTime())>0?'alert-info':''} ${(!a.isInspected()) && a?.attentionDate.compareTo(new Date().clearTime())<=0?'alert-error':''}">${a?.encodeAsHTML() + " ("+a?.attentionDate?.format("dd/MM/yyyy")+")"}</li>
                        </g:each>
                    </ul>
				</td>
			</tr>
		
		</tbody>
	</table>				
									
	<h4> <g:message code="wish.title.dates.label" default="Dates"/> </h4>

	<table class="table">
		<tbody>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.wishDate.label" default="Wish Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.wishDate}" /></td>
				
			</tr>

			<tr class="prop">

				<td valign="top" class="name"><g:message code="wish.cartonPrintingInfoSentDate.label" default="Carton Printing Info Sent Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.cartonPrintingInfoSentDate}" /></td>
				
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
		</tbody>
	</table>						
								
	<h4> <g:message code="wish.title.payment.label" default="Payment"/> </h4>
	
	<table class="table">
		<tbody>
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
				
				<td valign="top" class="value"><g:formatNumber number="${wishInstance.conversion}" minFractionDigits="2" />   </td>
							
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.currencyFob.label" default="Currency Fob" /></td>
				
				<td valign="top" class="value"><g:formatNumber number="${wishInstance.currencyFob}" minFractionDigits="2" /> </td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.foreignCurrencyFob.label" default="FOB Divisa" /></td>
				
				<td valign="top" class="value"><g:formatNumber number="${wishInstance.foreignCurrencyFob}" minFractionDigits="2" maxFractionDigits="2" /> </td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.paymentStatus.label" default="Payment Status" /></td>
				
				<td valign="top" class="value"><g:link controller="paymentStatus" action="show" id="${wishInstance?.paymentStatus?.id}">${wishInstance?.paymentStatus?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.paymentTerm.label" default="Payment Term" /></td>
				
				<td valign="top" class="value">${wishInstance?.paymentTerm?.encodeAsHTML()}</td>
				
			</tr>	

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateOfMoneyInAdvanceTransfer.label" default="Date Of Money In Advance Transfer" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateOfMoneyInAdvanceTransfer}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.amountOfMoneyInAdvanceTransferred.label" default="Amount Of Money In Advance Transferred" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "amountOfMoneyInAdvanceTransferred")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.moneyBalance.label" default="Money Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "moneyBalance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateOfBalancePayment.label" default="Date Of Balance Payment" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateOfBalancePayment}" /></td>
				
			</tr>					
		</tbody>
	</table>
							
	<h4> <g:message code="wish.title.load.label" default="Products"/> </h4>

	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.productDescription.label" default="Product description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "productDescription")}</td>
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
				
				<td valign="top" class="value">${wishInstance?.typeOfFreight?.encodeAsHTML()}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.loadUnits.label" default="Load Units" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishInstance.loadUnits}" var="l">
						<li><g:link controller="product" action="show" id="${l.product.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>	
											
	<h4> <g:message code="wish.title.djai.label" default="DJAI"/> </h4>

	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.licenses.label" default="Licenses" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.licenses}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiNumber.label" default="Djai Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "djaiNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiFormalizationDate.label" default="Djai Formalization Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.djaiFormalizationDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiExtendedRequested.label" default="Djai Extended Requested" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.djaiExtendedRequested}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiExtendedExpiration.label" default="Djai Extended Expiration" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.djaiExtendedExpiration}" /></td>
				
			</tr>
		</tbody>
	</table>

	<h4> <g:message code="wish.title.positionTariff.label" default="Position tariff"/> </h4>	

	<table class="table">
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.hsCodeToBeWritten.label" default="Hs Code To Be Written" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "hsCodeToBeWritten")}</td>
				
			</tr>
			
			
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.criterionValue.label" default="Criterion Value" /></td>
				
				<td valign="top" class="value"><g:link controller="criterionValue" action="show" id="${wishInstance?.criterionValue?.id}">${wishInstance?.criterionValue?.encodeAsHTML()}</g:link></td>
				
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
				<td valign="top" class="name"><g:message code="wish.visaSecondStage.label" default="Visa second stage?" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.visaSecondStage}" /></td>
				
			</tr>
				
		</tbody>
	</table>					

	<h4> <g:message code="wish.title.swifts.label" default="Swifts"/> </h4>

	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.swiftReceivedDate.label" default="Swift Received Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${wishInstance?.swiftReceivedDate}" /></td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.swiftSentToSupplierDate.label" default="Swift Sent To Supplier Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${wishInstance?.swiftSentToSupplierDate}" /></td>
				
			</tr>
		</tbody>
	</table>
	
	<h4> <g:message code="wish.title.document.label" default="Documents"/> </h4>

	<table class="table">
		<tbody>
			<tr class="prop">
				<td colspan="2" valign="top" class="name">
					<h5><g:message code="wish.firstStageRequiredDocuments.label" default="First Stage Required Documents"/></h5>
					<g:if test="${wishInstance?.firstStageRequiredDocuments?.size() != 0}">
						<g:render template="documentShow" model="['documents':wishInstance?.firstStageRequiredDocuments]"/>
					</g:if>						
				</td>				
			</tr>

            <tr class="prop">
                <td colspan="2" valign="top" class="name">
                    <h5><g:message code="wish.secondStageRequiredDocuments.label" default="Second Stage Required Documents"/></h5>
                    <g:if test="${wishInstance?.secondStageRequiredDocuments?.size() != 0}">
                    	<g:render template="documentShow" model="['documents':wishInstance?.secondStageRequiredDocuments]"/>
                    </g:if>
                </td>
            </tr>
         </tbody>
	</table>

	<h4> <g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery"/> </h4>
          
	<table class="table">
		<tbody>          
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.docDraftApproved.label" default="Doc Draft Approved" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.docDraftApproved}" /></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.docDraftNotReceive.label" default="Drafts won't be received" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.docDraftNotReceive}" /></td>
				
			</tr>
			
			<tr class="prop">
				<td colspan="2" valign="top" class="name">
					<p><g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery"/></p>
					<g:if test="${wishInstance?.docDraftToBeApprovedBeforeDelivery?.size() != 0}">
						<g:render template="draftShow" model="['drafts':wishInstance?.docDraftToBeApprovedBeforeDelivery]"/>
					</g:if>
				</td>				
			</tr>
			
			<tr class="prop" id="picturesOfPrintingBoxesAndLoadReceived">
				<td valign="top" class="name"><g:message code="wish.picturesOfPrintingBoxesAndLoadReceived.label" default="Pictures Of Printing Boxes And Load Received" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.picturesOfPrintingBoxesAndLoadReceived}" /></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfPrintingBoxesNotReceive.label" default="Pictures of printing boxes won't be received" /></td>
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.picturesOfPrintingBoxesNotReceive}" /></td>				
			</tr>

		
			<tr class="prop" id="picturesOfLoadingContainerReceived">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainerReceived.label" default="Pictures Of Loading Container Received" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.picturesOfLoadingContainerReceived}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainerNotReceive.label" default="Pictures of loading container won't be received" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.picturesOfLoadingContainerNotReceive}" /></td>
				
			</tr>


			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainer.label" default="Pictures Of Loading Container" /></td>
	
				<td valign="top" style="text-align: left;" class="value">
					<g:render template="picturesContainer" model="['wishInstance':wishInstance]"/>
				</td>
			</tr>			
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfPrintingBoxes.label" default="Pictures Of Printing Boxes" /></td>
	
				<td valign="top" style="text-align: left;" class="value">
					<g:render template="picturesBoxes" model="['wishInstance':wishInstance]"/>
				</td>
			</tr>			
		</tbody>
	</table>	
	
	<h4> <g:message code="wish.title.freight.label" default="Freight"/> </h4>
	
	<table class="table">
		<tbody>
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
				<td valign="top" class="name"><g:message code="wish.hasFeeder.label" default="Has feeder?" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.hasFeeder}" /></td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.blNumber.label" default="Bl Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "blNumber")}</td>
				
			</tr>
			
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.blCopyReceived.label" default="Bl copy received?" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.blCopyReceived}" /></td>
				
			</tr>
			
			

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.freightQuote.label" default="Freight Quote" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "freightQuote")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.loadSecuredPercent.label" default="Load Secured Percent" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "loadSecuredPercent")}</td>
				
			</tr>
		</tbody>
	</table>
	
	<h4> <g:message code="wish.title.final.label" default="Final data"/> </h4>

	<table class="table">
		<tbody>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.bill.label" default="Bill" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "bill")}</td>		
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.billDate.label" default="Bill Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.billDate}" /></td>
				
			</tr>	
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.taxRegistryNumberAndCuitVerification.label" default="Tax Registry Number And Cuit Verification" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.taxRegistryNumberAndCuitVerification}" /></td>
				
			</tr>
				
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dispatchNumber.label" default="Dispatch Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "dispatchNumber")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.finishDate.label" default="Finish Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.finishDate}" /></td>
				
			</tr>
		</tbody>
	</table>
			
	<g:render template="/_note/noteShow" model="['notes':wishInstance?.notes]"/>
	
	<h4> <g:message code=" " default=" "/> </h4>
											
	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateCreated}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${wishInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'inputFile.css')}" />
<script type="text/javascript" src="${resource(dir:'js', file:'multipleInput.js')}"> </script>	


</body>

</html>
