
<%@ page import="prices.SupplierPriceCriteria" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-supplierPriceCriteria" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="supplierPriceCriteria.product.label" default="Product" /></th>
			
				<th><g:message code="supplierPriceCriteria.variable.label" default="Variable" /></th>
			
				<g:sortableColumn property="priceVariableFrom" title="${message(code: 'supplierPriceCriteria.priceVariableFrom.label', default: 'Price Variable From')}" />
			
				<g:sortableColumn property="priceVariableTo" title="${message(code: 'supplierPriceCriteria.priceVariableTo.label', default: 'Price Variable To')}" />
			
				<g:sortableColumn property="basePrice1" title="${message(code: 'supplierPriceCriteria.basePrice1.label', default: 'Base Price1')}" />
			
				<g:sortableColumn property="basePrice2" title="${message(code: 'supplierPriceCriteria.basePrice2.label', default: 'Base Price2')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${supplierPriceCriteriaInstanceList}" status="i" var="supplierPriceCriteriaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${supplierPriceCriteriaInstance.id}">${fieldValue(bean: supplierPriceCriteriaInstance, field: "product")}</g:link></td>
			
				<td>${fieldValue(bean: supplierPriceCriteriaInstance, field: "variable")}</td>
			
				<td>${fieldValue(bean: supplierPriceCriteriaInstance, field: "priceVariableFrom")}</td>
			
				<td>${fieldValue(bean: supplierPriceCriteriaInstance, field: "priceVariableTo")}</td>
			
				<td>${fieldValue(bean: supplierPriceCriteriaInstance, field: "basePrice1")}</td>
			
				<td>${fieldValue(bean: supplierPriceCriteriaInstance, field: "basePrice2")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${supplierPriceCriteriaInstanceTotal}" />
	</div>
</section>

</body>

</html>
