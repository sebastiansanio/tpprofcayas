
<%@ page import="stakeholder.Customer" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-customer" class="first">


	<table class="table table-bordered display cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'customer.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'customer.email.label', default: 'Email')}" />
			
				<th><g:message code="stakeholder.defaultReport.label" default="Default Report" /></th>
			
				<th><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></th>
			
				<g:sortableColumn property="address" title="${message(code: 'customer.address.label', default: 'Address')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerInstanceList}" status="i" var="customerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: customerInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "defaultReport")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "defaultLocale")}</td>
			
				<td>${fieldValue(bean: customerInstance, field: "address")}</td>
			
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
