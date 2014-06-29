
<%@ page import="alert.AlertMessage" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alertMessage.label', default: 'AlertMessage')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-alertMessage" class="first">

	<table class="table">
		<tbody>


			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertMessage.subject.label" default="Subject" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertMessageInstance, field: "subject")}</td>
				
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertMessage.message.label" default="Message" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertMessageInstance, field: "message")}</td>
				
			</tr>



		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertMessage.language.label" default="Language" /></td>
				
				<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${alertMessageInstance?.language?.id}">${alertMessageInstance?.language?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertMessage.alertType.label" default="Alert Type" /></td>
				
				<td valign="top" class="value"><g:link controller="alertType" action="show" id="${alertMessageInstance?.alertType?.id}">${alertMessageInstance?.alertType?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertMessage.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${alertMessageInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertMessage.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${alertMessageInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
