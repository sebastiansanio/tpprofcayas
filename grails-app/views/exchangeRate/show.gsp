
<%@ page import="prices.ExchangeRate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'exchangeRate.label', default: 'ExchangeRate')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-exchangeRate" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exchangeRate.currency.label" default="Currency" /></td>
				
				<td valign="top" class="value"><g:link controller="currency" action="show" id="${exchangeRateInstance?.currency?.id}">${exchangeRateInstance?.currency?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exchangeRate.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${exchangeRateInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exchangeRate.value.label" default="Value" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: exchangeRateInstance, field: "value")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exchangeRate.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${exchangeRateInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exchangeRate.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${exchangeRateInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
