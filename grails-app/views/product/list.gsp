
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
				<g:sortableColumn property="companyCode" title="${message(code: 'product.companyCode.label')}" />
			
				<g:sortableColumn property="descriptionSP" title="${message(code: 'product.descriptionSP.label', default: 'Description SP')}" />
				
				<th><g:message code="product.color.label" default="Color" /></th>
						
				<th><g:message code="product.supplierCode.label" default="Supplier Code" /></th>

				<th><g:message code="product.customerCode.label" default="Customer Code" /></th>

				<th><g:message code="supplier.label" default="Supplier" /></th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "companyCode")}</g:link></td>
				
				<td>${fieldValue(bean: productInstance, field: "descriptionSP")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "color")}</td>
				
				<td>${fieldValue(bean: productInstance, field: "supplierCode")}</td>			

				<td>${fieldValue(bean: productInstance, field: "customerCode")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "supplier")}</td>
			
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
