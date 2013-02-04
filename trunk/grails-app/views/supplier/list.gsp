
<%@ page import="stakeholder.Supplier" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-supplier" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'supplier.name.label', default: 'Name')}" />
			
				<th><g:message code="supplier.user.label" default="User" /></th>
			
				<g:sortableColumn property="address" title="${message(code: 'supplier.address.label', default: 'Address')}" />
			
				<th><g:message code="supplier.country.label" default="Country" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'supplier.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'supplier.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: supplierInstance, field: "user")}</td>
			
				<td>${fieldValue(bean: supplierInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: supplierInstance, field: "country")}</td>
			
				<td><g:formatDate date="${supplierInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${supplierInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${supplierInstanceTotal}" />
	</div>
</section>

</body>

</html>
