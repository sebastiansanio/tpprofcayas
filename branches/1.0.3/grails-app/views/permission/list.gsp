
<%@ page import="login.Permission" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'permission.label', default: 'Permission')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-permission" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'permission.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="permissionString" title="${message(code: 'permission.permissionString.label', default: 'Permission String')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${permissionInstanceList}" status="i" var="permissionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${permissionInstance.id}">${fieldValue(bean: permissionInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: permissionInstance, field: "permissionString")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${permissionInstanceTotal}" />
	</div>
</section>

</body>

</html>
