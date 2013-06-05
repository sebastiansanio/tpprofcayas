
<%@ page import="login.Permission" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'permission.label', default: 'Permission')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-permission" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="permission.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: permissionInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="permission.permissionString.label" default="Permission String" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: permissionInstance, field: "permissionString")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
