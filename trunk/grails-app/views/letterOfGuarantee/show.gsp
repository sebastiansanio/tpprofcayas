
<%@ page import="wish.LetterOfGuarantee" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-letterOfGuarantee" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.customer.label" default="Customer" /></td>
				
				<td valign="top" class="value"><g:link controller="customer" action="show" id="${letterOfGuaranteeInstance?.customer?.id}">${letterOfGuaranteeInstance?.customer?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.forwarder.label" default="Forwarder" /></td>
				
				<td valign="top" class="value"><g:link controller="forwarder" action="show" id="${letterOfGuaranteeInstance?.forwarder?.id}">${letterOfGuaranteeInstance?.forwarder?.encodeAsHTML()}</g:link></td>
			
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.year.label" default="Year" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: letterOfGuaranteeInstance, field: "year")}</td>
				
			</tr>
				
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.deliveryDate.label" default="Delivery Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${letterOfGuaranteeInstance?.deliveryDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${letterOfGuaranteeInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${letterOfGuaranteeInstance?.lastUpdated}" /></td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
