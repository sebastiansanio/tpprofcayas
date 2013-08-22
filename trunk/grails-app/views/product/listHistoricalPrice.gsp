
<%@ page import="product.HistoricalPrice" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'historicalPrice.label', default: 'HistoricalPrice')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-historicalPrice" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="price" title="${message(code: 'product.pricePerUnit.label', default: 'Price per unit')}" />
			
				<g:sortableColumn property="dateFrom" title="${message(code: 'product..dateFrom.label', default: 'Date From')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${historicalPriceInstanceList}" status="i" var="historicalPriceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${idProduct}">${historicalPriceInstance.price}</g:link></td>
			
				<td><g:formatDate date="${historicalPriceInstance.dateFrom}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${historicalPriceInstanceTotal}" />
	</div>
</section>

</body>

</html>
