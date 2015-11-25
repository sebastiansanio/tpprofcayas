
<%@ page import="wish.ProductWish" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productWish.label', default: 'ProductWish')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-productWish" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="id" title="${message(code: 'productWish.id.label')}" />
				
				<th><g:message code="productWish.customer.label" default="Customer" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'productWish.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'productWish.lastUpdated.label', default: 'Last Updated')}" />
	
				<th><g:message code="productWish.amount.label" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productWishInstanceList}" status="i" var="productWishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${productWishInstance.id}">${fieldValue(bean: productWishInstance, field: "id")}</g:link></td>
					
				<td>${fieldValue(bean: productWishInstance, field: "customer")}</td>
			
				<td><g:formatDate date="${productWishInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${productWishInstance.lastUpdated}" /></td>
				
				<td>${productWishInstance.total}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productWishInstanceTotal}" />
	</div>
</section>

</body>

</html>
