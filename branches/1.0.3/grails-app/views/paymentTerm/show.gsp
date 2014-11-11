
<%@ page import="modal.PaymentTerm" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentTerm.label', default: 'PaymentTerm')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-paymentTerm" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentTerm.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentTermInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentTerm.percentPaymentAfterDelivery.label" default="Percent Payment After Delivery" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentTermInstance, field: "percentPaymentAfterDelivery")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentTerm.paymentDaysAfterTimeOfArrival.label" default="Payment Days After Time Of Arrival" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentTermInstance, field: "paymentDaysAfterTimeOfArrival")}</td>
				
			</tr>
			
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentTerm.requiresAdvancePayment.label" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${paymentTermInstance.requiresAdvancePayment}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentTerm.wishes.label" default="Wishes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${paymentTermInstance.wishes}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
