
<%@ page import="login.User" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.stakeholder.label" default="Stakeholder" /></td>
				
				<td valign="top" class="value"><g:link controller="stakeholder" action="show" id="${userInstance?.stakeholder?.id}">${userInstance?.stakeholder?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userInstance?.lastUpdated}" /></td>
				
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.roles.label" default="Roles" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.roles}" var="r">
						<li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
