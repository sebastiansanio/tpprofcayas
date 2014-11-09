
<%@ page import="modal.Country" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-country" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'country.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${countryInstanceList}" status="i" var="countryInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean: countryInstance, field: "name")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${countryInstanceTotal}" />
	</div>
</section>

</body>

</html>
