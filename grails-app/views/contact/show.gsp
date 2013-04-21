
<%@ page import="stakeholder.Contact" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-contact" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.position.label" default="Position" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactInstance, field: "position")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.birthday.label" default="Birthday" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${contactInstance?.birthday}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.phone.label" default="Phone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactInstance, field: "phone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.cellPhone.label" default="Cell Phone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactInstance, field: "cellPhone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.note.label" default="Note" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactInstance, field: "note")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${contactInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.sendAlerts.label" default="Send Alerts" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${contactInstance?.sendAlerts}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.sendReports.label" default="Send Reports" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${contactInstance?.sendReports}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contact.stakeholder.label" default="Stakeholder" /></td>
				
				<td valign="top" class="value"><g:link controller="${contactInstance?.stakeholder?.type}" action="show" id="${contactInstance?.stakeholder?.id}">${contactInstance?.stakeholder?.encodeAsHTML()}</g:link></td>
					
			</tr>
			
		</tbody>
	</table>
</section>

</body>

</html>
