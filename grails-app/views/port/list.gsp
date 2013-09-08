
<%@ page import="modal.Port" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'port.label', default: 'Port')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-port" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
				<g:sortableColumn property="name" title="${message(code: 'port.name.label', default: 'Name')}" />
			
				<th><g:message code="port.country.label" default="Country" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${portInstanceList}" status="i" var="portInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				
				<td><g:link action="show" id="${portInstance.id}">${fieldValue(bean: portInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: portInstance, field: "country")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${portInstanceTotal}" />
	</div>
</section>

</body>

</html>
