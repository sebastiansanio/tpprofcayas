
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

<g:set var="fields" value="${user.stakeholder.defaultReport.fields}"/>

<section id="show-wish" class="first">


	<g:if test="${fields.contains('customer') || fields.contains('supplier') || fields.contains('shipper') || fields.contains('customsBroker') || fields.contains('forwarder') || fields.contains('agent')}">
	<h4> <g:message code="wish.title.generalData.label" default="General Data"/> </h4>

	<table class="table">
		<tbody>
		
			<g:if test="${fields.contains('customer')}">
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customer.label" default="Customer" /></td>
				<td valign="top" class="value">${wishInstance?.customer?.encodeAsHTML()}</td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('supplier')}">		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.supplier.label" default="Supplier" /></td>
				<td valign="top" class="value">${wishInstance?.supplier?.encodeAsHTML()}</td>	
			</tr>		
			</g:if>
			
			<g:if test="${fields.contains('shipper')}">					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.shipper.label" default="Shipper" /></td>
				<td valign="top" class="value">${wishInstance?.shipper?.encodeAsHTML()}</td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('customsBroker')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customsBroker.label" default="Customs Broker" /></td>
				<td valign="top" class="value">${wishInstance?.customsBroker?.encodeAsHTML()}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('forwarder')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.forwarder.label" default="Forwarder" /></td>				
				<td valign="top" class="value">${wishInstance?.forwarder?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('agent')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.agent.label" default="Agent" /></td>
				<td valign="top" class="value">${wishInstance?.agent?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>
	
	<g:if test="${fields.contains('wishStatus')}">	
	<h4> <g:message code="wish.title.wishStatus.label" default="Wish status"/> </h4>
	<table class="table">
		<tbody>
					
			<g:if test="${fields.contains('wishStatus')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.wishStatus.label" default="Wish Status" /></td>				
				<td valign="top" class="value">${wishInstance?.wishStatus?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>
		
	<g:if test="${fields.contains('opNumber') || fields.contains('customerOpNumber') || fields.contains('supplierOrder') || fields.contains('customsBrokerRefNumber') || fields.contains('forwarderRefNumber')}">
	<h4> <g:message code="wish.title.reference.label" default="Reference"/> </h4>
	<table class="table">
		<tbody>
			<g:if test="${fields.contains('opNumber')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.opNumber.label" default="Op Number" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "opNumber")}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('customerOpNumber')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customerOpNumber.label" default="Customer Op Number" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "customerOpNumber")}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('supplierOrder')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.supplierOrder.label" default="Supplier Order" /></td>
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('customsBrokerRefNumber')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customsBrokerRefNumber.label" default="Customs Broker Ref Number" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "customsBrokerRefNumber")}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('forwarderRefNumber')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.forwarderRefNumber.label" default="Forwarder Ref Number" /></td>	
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "forwarderRefNumber")}</td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>
						
	<h4> <g:message code="wish.activeAlerts.label" default="Active Alerts" /> </h4>	
	
	<table class="table">
		<tbody>
			<tr class="prop">
				<td colspan="2" valign="top" class="name">
                    <ul>
                        <g:each in="${wishInstance.activeAlerts.sort{it.attentionDate}}" var="a">
                        
	                        <g:if test="${a.alertType.stakeholders.contains(user.stakeholder.type)}">
	                        <li class="alert ${(!a.isInspected()) && a?.attentionDate.compareTo(new Date().clearTime())>0?'alert-info':''} ${(!a.isInspected()) && a?.attentionDate.compareTo(new Date().clearTime())<=0?'alert-error':''}">${a?.alertType?.externalMessage?.encodeAsHTML() + " ("+a?.attentionDate?.format("dd/MM/yyyy")+")"}</li>
	                       	</g:if>
                        </g:each>
                    </ul>
				</td>
			</tr>
		
		</tbody>
	</table>				
									
	<g:if test="${fields.contains('wishDate') || fields.contains('cartonPrintingInfoSentDate') || fields.contains('deliveryDate') || fields.contains('estimatedTimeOfDeparture') || fields.contains('timeOfDeparture') || fields.contains('estimatedTimeOfArrival') || fields.contains('timeOfArrival')}">								
	<h4> <g:message code="wish.title.dates.label" default="Dates"/> </h4>
	<table class="table">
		<tbody>
						
			<g:if test="${fields.contains('wishDate')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.wishDate.label" default="Wish Date" /></td>	
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.wishDate}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('cartonPrintingInfoSentDate')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.cartonPrintingInfoSentDate.label" default="Carton Printing Info Sent Date" /></td>
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.cartonPrintingInfoSentDate}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('deliveryDate')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.deliveryDate.label" default="Delivery Date" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.deliveryDate}" /></td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('estimatedTimeOfDeparture')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.estimatedTimeOfDeparture.label" default="Estimated Time Of Departure" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.estimatedTimeOfDeparture}" /></td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('timeOfDeparture')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.timeOfDeparture.label" default="Time Of Departure" /></td>
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.timeOfDeparture}" /></td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('estimatedTimeOfArrival')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.estimatedTimeOfArrival.label" default="Estimated Time Of Arrival" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.estimatedTimeOfArrival}" /></td>
			</tr>
			</g:if>	
						
			<g:if test="${fields.contains('timeOfArrival')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.timeOfArrival.label" default="Time Of Arrival" /></td>
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.timeOfArrival}" /></td>				
			</tr>
			</g:if>
		</tbody>
	</table>		
	</g:if>				
	
	
	<g:if test="${fields.contains('priceCondition') || fields.contains('currency') || fields.contains('conversion') || fields.contains('currencyFob') || fields.contains('foreignCurrencyFob') || fields.contains('paymentStatus') || fields.contains('paymentTerm') || fields.contains('dateOfMoneyInAdvanceTransfer') || fields.contains('amountOfMoneyInAdvanceTransferred') || fields.contains('moneyBalance') || fields.contains('dateOfBalancePayment')}">								
	<h4> <g:message code="wish.title.payment.label" default="Payment"/> </h4>
	<table class="table">
		<tbody>

			<g:if test="${fields.contains('priceCondition')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.priceCondition.label" default="Price Condition" /></td>				
				<td valign="top" class="value">${wishInstance?.priceCondition?.encodeAsHTML()}</td>
			</tr>
			</g:if>
					
			<g:if test="${fields.contains('currency')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.currency.label" default="Currency" /></td>
				<td valign="top" class="value">${wishInstance?.currency?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('conversion')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.conversion.label" default="Conversion" /></td>
				<td valign="top" class="value"><g:formatNumber number="${wishInstance.conversion}" minFractionDigits="2" />   </td>							
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('currencyFob')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.currencyFob.label" default="Currency Fob" /></td>				
				<td valign="top" class="value"><g:formatNumber number="${wishInstance.currencyFob}" minFractionDigits="2" /> </td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('foreignCurrencyFob')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.foreignCurrencyFob.label" default="FOB Divisa" /></td>				
				<td valign="top" class="value"><g:formatNumber number="${wishInstance.foreignCurrencyFob}" minFractionDigits="2" maxFractionDigits="2" /> </td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('paymentStatus')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.paymentStatus.label" default="Payment Status" /></td>				
				<td valign="top" class="value">${wishInstance?.paymentStatus?.encodeAsHTML()}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('paymentTerm')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.paymentTerm.label" default="Payment Term" /></td>				
				<td valign="top" class="value">${wishInstance?.paymentTerm?.encodeAsHTML()}</td>
			</tr>	
			</g:if>


			<g:if test="${fields.contains('dateOfMoneyInAdvanceTransfer')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateOfMoneyInAdvanceTransfer.label" default="Date Of Money In Advance Transfer" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateOfMoneyInAdvanceTransfer}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('amountOfMoneyInAdvanceTransferred')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.amountOfMoneyInAdvanceTransferred.label" default="Amount Of Money In Advance Transferred" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "amountOfMoneyInAdvanceTransferred")}</td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('moneyBalance')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.moneyBalance.label" default="Money Balance" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "moneyBalance")}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('dateOfBalancePayment')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateOfBalancePayment.label" default="Date Of Balance Payment" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateOfBalancePayment}" /></td>
			</tr>		
			</g:if>			
		</tbody>
	</table>
	</g:if>
							
							
	<g:if test="${fields.contains('productDescription') || fields.contains('shippingMark') || fields.contains('customerLogoPunch') || fields.contains('cbm') || fields.contains('grossWeight') || fields.contains('netWeight') || fields.contains('palletsQuantity') || fields.contains('typeOfFreight') || fields.contains('loadUnits')}">								
	<h4> <g:message code="wish.title.load.label" default="Products"/> </h4>
	<table class="table">
		<tbody>
			<g:if test="${fields.contains('productDescription')}">	
			<tr class="prop">			
				<td valign="top" class="name"><g:message code="wish.productDescription.label" default="Product description" /></td>
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "productDescription")}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('shippingMark')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.shippingMark.label" default="Shipping Mark" /></td>				
				<td valign="top" class="value">${wishInstance?.shippingMark?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('customerLogoPunch')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.customerLogoPunch.label" default="Customer Logo Punch" /></td>				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.customerLogoPunch}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('cbm')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.cbm.label" default="Cbm" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "cbm")}</td>				
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('grossWeight')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.grossWeight.label" default="Gross Weight" /></td>
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "grossWeight")}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('netWeight')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.netWeight.label" default="Net Weight" /></td>
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "netWeight")}</td>				
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('palletsQuantity')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.palletsQuantity.label" default="Pallets Quantity" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "palletsQuantity")}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('typeOfFreight')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.typeOfFreight.label" default="Type Of Freight" /></td>				
				<td valign="top" class="value">${wishInstance?.typeOfFreight?.encodeAsHTML()}</td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('loadUnits')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.loadUnits.label" default="Load Units" /></td>				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishInstance.loadUnits}" var="l">
						<li>${l?.encodeAsHTML()}</li>
					</g:each>
					</ul>
				</td>
			</tr>
			</g:if>
		</tbody>
	</table>	
	</g:if>
												
	<g:if test="${fields.contains('licenses') || fields.contains('djaiNumber') || fields.contains('djaiFormalizationDate') || fields.contains('djaiExtendedRequested') || fields.contains('djaiExtendedExpiration')}">								
	<h4> <g:message code="wish.title.djai.label" default="DJAI"/> </h4>
	<table class="table">
		<tbody>
			<g:if test="${fields.contains('licenses')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.licenses.label" default="Licenses" /></td>				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.licenses}" /></td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('djaiNumber')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiNumber.label" default="Djai Number" /></td>
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "djaiNumber")}</td>				
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('djaiFormalizationDate')}">	
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiFormalizationDate.label" default="Djai Formalization Date" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.djaiFormalizationDate}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('djaiExtendedRequested')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiExtendedRequested.label" default="Djai Extended Requested" /></td>
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.djaiExtendedRequested}" /></td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('djaiExtendedExpiration')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.djaiExtendedExpiration.label" default="Djai Extended Expiration" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.djaiExtendedExpiration}" /></td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>


	<g:if test="${fields.contains('hsCodeToBeWritten') || fields.contains('criterionValue') || fields.contains('visaChargePayment') || fields.contains('visaChargePaymentConcept')}">								
	<h4> <g:message code="wish.title.positionTariff.label" default="Position tariff"/> </h4>	
	<table class="table">
		<tbody>
			<g:if test="${fields.contains('hsCodeToBeWritten')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.hsCodeToBeWritten.label" default="Hs Code To Be Written" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "hsCodeToBeWritten")}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('criterionValue')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.criterionValue.label" default="Criterion Value" /></td>				
				<td valign="top" class="value">${wishInstance?.criterionValue?.encodeAsHTML()}</td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('visaChargePayment')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.visaChargePayment.label" default="Visa Charge Payment" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "visaChargePayment")}</td>
			</tr>
			</g:if>
		

			<g:if test="${fields.contains('visaChargePaymentConcept')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.visaChargePaymentConcept.label" default="Visa Charge Payment Concept" /></td>				
				<td valign="top" class="value">${wishInstance?.visaChargePaymentConcept?.encodeAsHTML()}</td>
			</tr>	
			</g:if>
		</tbody>
	</table>					
	</g:if>

	<g:if test="${fields.contains('swiftReceivedDate') || fields.contains('swiftReceivedDate')}">								
	<h4> <g:message code="wish.title.swifts.label" default="Swifts"/> </h4>
	<table class="table">
		<tbody>
			<g:if test="${fields.contains('swiftReceivedDate')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.swiftReceivedDate.label" default="Swift Received Date" /></td>				
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${wishInstance?.swiftReceivedDate}" /></td>
			</tr>
			</g:if>
				
			<g:if test="${fields.contains('swiftReceivedDate')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.swiftSentToSupplierDate.label" default="Swift Sent To Supplier Date" /></td>		
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${wishInstance?.swiftSentToSupplierDate}" /></td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>
	
	<g:if test="${fields.contains('firstStageRequiredDocuments') || fields.contains('secondStageRequiredDocuments')}">								
	<h4> <g:message code="wis h.title.document.label" default="Documents"/> </h4>
	<table class="table">
		<tbody>
			
			<g:if test="${fields.contains('firstStageRequiredDocuments')}">			
			<tr class="prop">
				<td colspan="2" valign="top" class="name">
					<h5><g:message code="wish.firstStageRequiredDocuments.label" default="First Stage Required Documents"/></h5>
					<g:if test="${wishInstance?.firstStageRequiredDocuments?.size() != 0}">
						<g:render template="documentShow" model="['documents':wishInstance?.firstStageRequiredDocuments]"/>
					</g:if>						
				</td>				
			</tr>
			</g:if>

			<g:if test="${fields.contains('secondStageRequiredDocuments')}">			
            <tr class="prop">
                <td colspan="2" valign="top" class="name">
                    <h5><g:message code="wish.secondStageRequiredDocuments.label" default="Second Stage Required Documents"/></h5>
                    <g:if test="${wishInstance?.secondStageRequiredDocuments?.size() != 0}">
                    	<g:render template="documentShow" model="['documents':wishInstance?.secondStageRequiredDocuments]"/>
                    </g:if>
                </td>
            </tr>
			</g:if>
         </tbody>
	</table>
	</g:if>
	
	<g:if test="${fields.contains('docDraftApproved') || fields.contains('docDraftNotReceive') || fields.contains('docDraftToBeApprovedBeforeDelivery') || fields.contains('picturesOfPrintingBoxesAndLoadReceived') || fields.contains('picturesOfPrintingBoxesNotReceive') || fields.contains('picturesOfLoadingContainerReceived') || fields.contains('picturesOfLoadingContainerNotReceive')}">								
	<h4> <g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery"/> </h4>      
	<table class="table">
		<tbody>          
			<g:if test="${fields.contains('docDraftApproved')}">			
  			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.docDraftApproved.label" default="Doc Draft Approved" /></td>			
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.docDraftApproved}" /></td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('docDraftNotReceive')}">			
 			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.docDraftNotReceive.label" default="Drafts won't be received" /></td>				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.docDraftNotReceive}" /></td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('docDraftToBeApprovedBeforeDelivery')}">			
			<tr class="prop">
				<td colspan="2" valign="top" class="name">
					<p><g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery"/></p>
					<g:if test="${wishInstance?.docDraftToBeApprovedBeforeDelivery?.size() != 0}">
						<g:render template="draftShow" model="['drafts':wishInstance?.docDraftToBeApprovedBeforeDelivery]"/>
					</g:if>
				</td>				
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('picturesOfPrintingBoxesAndLoadReceived')}">			
			<tr class="prop" id="picturesOfPrintingBoxesAndLoadReceived">
				<td valign="top" class="name"><g:message code="wish.picturesOfPrintingBoxesAndLoadReceived.label" default="Pictures Of Printing Boxes And Load Received" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.picturesOfPrintingBoxesAndLoadReceived}" /></td>
			</tr>
			</g:if>
			
			<g:if test="${fields.contains('picturesOfPrintingBoxesNotReceive')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfPrintingBoxesNotReceive.label" default="Pictures of printing boxes won't be received" /></td>
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.picturesOfPrintingBoxesNotReceive}" /></td>				
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('picturesOfLoadingContainerReceived')}">			
			<tr class="prop" id="picturesOfLoadingContainerReceived">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainerReceived.label" default="Pictures Of Loading Container Received" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.picturesOfLoadingContainerReceived}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('picturesOfLoadingContainerNotReceive')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.picturesOfLoadingContainerNotReceive.label" default="Pictures of loading container won't be received" /></td>				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.picturesOfLoadingContainerNotReceive}" /></td>
			</tr>
			</g:if>
		
		</tbody>
	</table>	
	</g:if>
	
	<g:if test="${fields.contains('sourceCountry') || fields.contains('port') || fields.contains('ship') || fields.contains('hasFeeder') || fields.contains('blNumber') || fields.contains('freightQuote') || fields.contains('loadSecuredPercent')}">								
	<h4> <g:message code="wish.title.freight.label" default="Freight"/> </h4>	
	<table class="table">
		<tbody>
			<g:if test="${fields.contains('sourceCountry')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.sourceCountry.label" default="Source Country" /></td>				
				<td valign="top" class="value">${wishInstance?.sourceCountry?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('port')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.port.label" default="Port" /></td>				
				<td valign="top" class="value">${wishInstance?.port?.encodeAsHTML()}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('ship')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.ship.label" default="Ship" /></td>				
				<td valign="top" class="value">${wishInstance?.ship?.encodeAsHTML()}</td>
			</tr>		
			</g:if>
			
			<g:if test="${fields.contains('hasFeeder')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.hasFeeder.label" default="Has feeder?" /></td>				
				<td valign="top" class="value"><g:formatBoolean boolean="${wishInstance?.hasFeeder}" /></td>
			</tr>
			</g:if>
					
			<g:if test="${fields.contains('blNumber')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.blNumber.label" default="Bl Number" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "blNumber")}</td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('freightQuote')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.freightQuote.label" default="Freight Quote" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "freightQuote")}</td>
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('loadSecuredPercent')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.loadSecuredPercent.label" default="Load Secured Percent" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "loadSecuredPercent")}</td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>
	
	<g:if test="${fields.contains('bill') || fields.contains('billDate') || fields.contains('taxRegistryNumberAndCuitVerification') || fields.contains('dispatchNumber') || fields.contains('finishDate')}">								
	<h4> <g:message code="wish.title.final.label" default="Final data"/> </h4>
	<table class="table">
		<tbody>
			
			<g:if test="${fields.contains('bill')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.bill.label" default="Bill" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "bill")}</td>		
			</tr>
			</g:if>
		
			<g:if test="${fields.contains('billDate')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.billDate.label" default="Bill Date" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.billDate}" /></td>
			</tr>	
			</g:if>
			
			<g:if test="${fields.contains('taxRegistryNumberAndCuitVerification')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.taxRegistryNumberAndCuitVerification.label" default="Tax Registry Number And Cuit Verification" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.taxRegistryNumberAndCuitVerification}" /></td>
			</tr>
			</g:if>
				
			<g:if test="${fields.contains('dispatchNumber')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dispatchNumber.label" default="Dispatch Number" /></td>				
				<td valign="top" class="value">${fieldValue(bean: wishInstance, field: "dispatchNumber")}</td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('finishDate')}">			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.finishDate.label" default="Finish Date" /></td>				
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.finishDate}" /></td>
			</tr>
			</g:if>
		</tbody>
	</table>
	</g:if>
			
	<g:if test="${fields.contains('notes')}">						
	<h4> <g:message code="wish.notes.label" default="Notes"/> </h4>
	<g:render template="notesShow" model="['notes':wishInstance.notes]"/>
	</g:if>
	
	
	<g:if test="${fields.contains('dateCreated') || fields.contains('lastUpdated')}">	
	<h4> <g:message code=" " default=" "/> </h4>
	<table class="table">
		<tbody>
		
			<g:if test="${fields.contains('dateCreated')}">						
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.dateCreated.label" default="Date Created" /></td>		
				<td valign="top" class="value"><g:formatDate date="${wishInstance?.dateCreated}" /></td>
			</tr>
			</g:if>

			<g:if test="${fields.contains('lastUpdated')}">						
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wish.lastUpdated.label" default="Last Updated" /></td>				
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${wishInstance?.lastUpdated}" /></td>
			</tr>
			</g:if>
		
		</tbody>
	</table>
	</g:if>
</section>


</body>

</html>
