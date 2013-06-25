
<%@ page import="audit.RevisionInformation" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'audit.label', default: 'Audit')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-revisionInformation" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="revisionInformation.currentUser.label" default="Current User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${revisionInformationInstance?.currentUser?.id}">${revisionInformationInstance?.currentUser?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="revisionInformation.timestamp.label" default="Timestamp" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${revisionInformationInstance?.timestamp}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>