
<%@ page import="prices.PriceVariableDate" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceVariableDate.label', default: 'PriceVariableDate')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-priceVariableDate" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateFrom" title="${message(code: 'priceVariableDate.dateFrom.label', default: 'Date From')}" />
			
				<g:sortableColumn property="dateTo" title="${message(code: 'priceVariableDate.dateTo.label', default: 'Date To')}" />
			
				<th><g:message code="priceVariableDate.priceVariable.label" default="Price Variable" /></th>
			
				<g:sortableColumn property="price" title="${message(code: 'priceVariableDate.price.label', default: 'Price')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'priceVariableDate.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'priceVariableDate.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${priceVariableDateInstanceList}" status="i" var="priceVariableDateInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${priceVariableDateInstance.id}">${fieldValue(bean: priceVariableDateInstance, field: "dateFrom")}</g:link></td>
			
				<td><g:formatDate date="${priceVariableDateInstance.dateTo}" /></td>
			
				<td>${fieldValue(bean: priceVariableDateInstance, field: "priceVariable")}</td>
			
				<td>${fieldValue(bean: priceVariableDateInstance, field: "price")}</td>
			
				<td><g:formatDate date="${priceVariableDateInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${priceVariableDateInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${priceVariableDateInstanceTotal}" />
	</div>
</section>

</body>

</html>
