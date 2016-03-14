
<%@ page import="product.PriceList" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceList.label', default: 'PriceList')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-priceList" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<th><g:message code="priceList.supplier.label" default="Supplier" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'priceList.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'priceList.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${priceListInstanceList}" status="i" var="priceListInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: priceListInstance, field: "supplier")}</td>

				<td><g:link action="show" id="${priceListInstance.id}">${fieldValue(bean: priceListInstance, field: "name")}</g:link></td>
				
				<td><g:formatDate date="${priceListInstance.lastUpdated}" /></td>		
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${priceListInstanceTotal}" />
	</div>
</section>

</body>

</html>
