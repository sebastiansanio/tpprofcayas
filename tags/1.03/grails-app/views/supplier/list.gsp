
<%@ page import="stakeholder.Supplier" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-supplier" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'supplier.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'supplier.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'supplier.email.label', default: 'Email')}" />
			
				<th><g:message code="stakeholder.defaultReport.label" default="Default Report" /></th>
			
				<th><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></th>
			
				<g:sortableColumn property="address" title="${message(code: 'supplier.address.label', default: 'Address')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: supplierInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: supplierInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: supplierInstance, field: "defaultReport")}</td>
			
				<td>${fieldValue(bean: supplierInstance, field: "defaultLocale")}</td>
			
				<td>${fieldValue(bean: supplierInstance, field: "address")}</td>
			
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
