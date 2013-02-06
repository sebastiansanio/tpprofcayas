
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
			
				<g:sortableColumn property="telephone" title="${message(code: 'customer.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'customer.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="address" title="${message(code: 'customer.address.label', default: 'Address')}" />
			
				<th><g:message code="customer.country.label" default="Country" /></th>
			
				<g:sortableColumn property="cuit" title="${message(code: 'customer.cuit.label', default: 'Cuit')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerInstanceList}" status="i" var="customerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: customerInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "address")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "country")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "cuit")}</td>
			
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
