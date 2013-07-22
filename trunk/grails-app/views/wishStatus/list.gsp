
<%@ page import="modal.WishStatus" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wishStatus.label', default: 'WishStatus')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-wishStatus" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'wishStatus.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'wishStatus.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishStatusInstanceList}" status="i" var="wishStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${wishStatusInstance.id}">${fieldValue(bean: wishStatusInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: wishStatusInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${wishStatusInstanceTotal}" />
	</div>
</section>

</body>

</html>
