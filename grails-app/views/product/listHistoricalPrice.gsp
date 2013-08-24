
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

	<p> <g:link role="button" class="btn btn-primary" action="show" id="${idProduct}"> <g:message code="default.back.label" default="Return back"/> </g:link> </p>
	
	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th>${message(code: 'product.pricePerUnit.label', default: 'Price per unit')} </th>
			
				<th>${message(code: 'product.dateFrom.label', default: 'Date From')}</th>
				
				<th> </th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${historicalPriceInstanceList}" status="i" var="historicalPriceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${historicalPriceInstance.price}</td>
			
				<td><g:formatDate date="${historicalPriceInstance.dateFrom}" /></td>
			
				<td> <g:link role="button" class="btn btn-primary" action="deleteHistoricalPrice" params="['idProduct': idProduct, 'idPrice': historicalPriceInstance.id ]" onclick="return confirm('${message( code: 'default.button.delete.confirm.message', default:'Are you sure?')}');"><i class='icon-trash'></i></g:link> </td>
			</tr>
		</g:each>
		</tbody>
	</table>

</section>

</body>

</html>
