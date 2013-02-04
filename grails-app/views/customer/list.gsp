
<%@ page import="stakeholder.Customer" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-customer" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" />
			
				<th><g:message code="customer.user.label" default="User" /></th>
			
				<g:sortableColumn property="address" title="${message(code: 'customer.address.label', default: 'Address')}" />
			
				<th><g:message code="customer.country.label" default="Country" /></th>
			
				<g:sortableColumn property="cuit" title="${message(code: 'customer.cuit.label', default: 'Cuit')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'customer.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerInstanceList}" status="i" var="customerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: customerInstance, field: "user")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "country")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "cuit")}</td>
			
				<td><g:formatDate date="${customerInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${customerInstanceTotal}" />
	</div>
</section>

</body>

</html>
