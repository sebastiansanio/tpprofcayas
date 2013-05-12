
<%@ page import="wish.Wish" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-wish" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="opNumber" title="${message(code: 'wish.opNumber.label', default: 'Op Number')}" />
			
				<g:sortableColumn property="customerOpNumber" title="${message(code: 'wish.customerOpNumber.label', default: 'Customer Op Number')}" />
			
				<g:sortableColumn property="customer.name" title="${message(code: 'wish.customer.label', default: 'Customer')}" />

				<g:sortableColumn property="supplier.name" title="${message(code: 'wish.supplier.label', default: 'Supplier')}" />
			
				<g:sortableColumn property="shipper.name" title="${message(code: 'wish.shipper.label', default: 'Shipper')}" />
			
				<g:sortableColumn property="supplierOrder" title="${message(code: 'wish.supplierOrder.label', default: 'Supplier Order')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishInstanceList}" status="i" var="wishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${wishInstance.id}">${fieldValue(bean: wishInstance, field: "opNumber")}</g:link></td>
			
				<td>${fieldValue(bean: wishInstance, field: "customerOpNumber")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "customer")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "supplier")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "shipper")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${wishInstanceTotal}" />
	</div>

	

</section>



</body>

</html>
