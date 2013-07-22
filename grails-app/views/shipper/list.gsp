
<%@ page import="stakeholder.Shipper" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shipper.label', default: 'Shipper')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-shipper" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'shipper.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'shipper.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'shipper.email.label', default: 'Email')}" />
			
				<th><g:message code="shipper.defaultReport.label" default="Default Report" /></th>
			
				<th><g:message code="shipper.defaultLocale.label" default="Default Locale" /></th>
			
				<th><g:message code="shipper.country.label" default="Country" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${shipperInstanceList}" status="i" var="shipperInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${shipperInstance.id}">${fieldValue(bean: shipperInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: shipperInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: shipperInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: shipperInstance, field: "defaultReport")}</td>
			
				<td>${fieldValue(bean: shipperInstance, field: "defaultLocale")}</td>
			
				<td>${fieldValue(bean: shipperInstance, field: "country")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${shipperInstanceTotal}" />
	</div>
</section>

</body>

</html>
