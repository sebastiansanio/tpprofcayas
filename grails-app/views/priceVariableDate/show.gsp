
<%@ page import="prices.PriceVariableDate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceVariableDate.label', default: 'PriceVariableDate')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-priceVariableDate" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceVariableDate.dateFrom.label" default="Date From" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${priceVariableDateInstance?.dateFrom}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceVariableDate.dateTo.label" default="Date To" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${priceVariableDateInstance?.dateTo}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceVariableDate.priceVariable.label" default="Price Variable" /></td>
				
				<td valign="top" class="value"><g:link controller="priceVariable" action="show" id="${priceVariableDateInstance?.priceVariable?.id}">${priceVariableDateInstance?.priceVariable?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceVariableDate.price.label" default="Price" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: priceVariableDateInstance, field: "price")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceVariableDate.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${priceVariableDateInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceVariableDate.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${priceVariableDateInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
