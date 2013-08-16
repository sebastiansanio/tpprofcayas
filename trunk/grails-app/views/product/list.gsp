
<%@ page import="product.Product" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-product" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="descriptionSP" title="${message(code: 'product.descriptionSP.label', default: 'Description SP')}" />
			
				<g:sortableColumn property="descriptionEN" title="${message(code: 'product.descriptionEN.label', default: 'Description EN')}" />
			
				<th><g:message code="product.color.label" default="Color" /></th>
			
				<g:sortableColumn property="status" title="${message(code: 'product.status.label', default: 'Status')}" />
			
				<th><g:message code="product.unit.label" default="Unit" /></th>
			
				<g:sortableColumn property="currency" title="${message(code: 'product.currency.label', default: 'Currency')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "descriptionSP")}</g:link></td>
			
				<td>${fieldValue(bean: productInstance, field: "descriptionEN")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "color")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "status")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "unit")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "currency")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productInstanceTotal}" />
	</div>
</section>

</body>

</html>
