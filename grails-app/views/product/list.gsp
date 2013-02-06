
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
			
				<g:sortableColumn property="descriptionES" title="${message(code: 'product.descriptionES.label', default: 'Description ES')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
			
				<th><g:message code="product.color.label" default="Color" /></th>
			
				<th><g:message code="product.family.label" default="Family" /></th>
			
				<th><g:message code="product.subFamily.label" default="Sub Family" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'product.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "descriptionES")}</g:link></td>
			
				<td>${fieldValue(bean: productInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "color")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "family")}</td>
			
				<td>${fieldValue(bean: productInstance, field: "subFamily")}</td>
			
				<td><g:formatDate date="${productInstance.dateCreated}" /></td>
			
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
