
<%@ page import="login.Role" %>
<%@ page import="login.Permission" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-role" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="role.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: roleInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="role.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${roleInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="role.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${roleInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="role.permissions.label" default="Permissions" /></td>
				
				<td valign="top" class="value">
					<g:each in="${Permission.findAllByPermissionStringInList(roleInstance?.permissions,[sort:'description'])}" var="s">
							<li>${s.description}</li>
					</g:each>
				
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="role.users.label" default="Users" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${roleInstance.users}" var="u">
						<li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
