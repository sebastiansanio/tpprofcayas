
<%@ page import="prices.ExchangeRate" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'exchangeRate.label', default: 'ExchangeRate')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-exchangeRate" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="exchangeRate.currency.label" default="Currency" /></th>
			
				<g:sortableColumn property="date" title="${message(code: 'exchangeRate.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="value" title="${message(code: 'exchangeRate.value.label', default: 'Value')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'exchangeRate.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'exchangeRate.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${exchangeRateInstanceList}" status="i" var="exchangeRateInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${exchangeRateInstance.id}">${fieldValue(bean: exchangeRateInstance, field: "currency")}</g:link></td>
			
				<td><g:formatDate date="${exchangeRateInstance.date}" /></td>
			
				<td>${fieldValue(bean: exchangeRateInstance, field: "value")}</td>
			
				<td><g:formatDate date="${exchangeRateInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${exchangeRateInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${exchangeRateInstanceTotal}" />
	</div>
</section>

</body>

</html>
