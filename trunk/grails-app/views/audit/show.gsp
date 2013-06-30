
<%@ page import="audit.RevisionInformation" %>
<%@ page import="courier.*" %>
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
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="revisionInformation.details.label" default="Details" /></td>
				
				<td valign="top" class="value">
				<g:each in ="${revisionInformationInstance.details.sort{it.id}}" var="detail">
					<h5>${message(code:'revisionType.'+detail.revisionType.toString().toLowerCase()+'.label') + ' '+ message(code:(grailsApplication.getDomainClass(detail.className).name.substring(0,1).toLowerCase() + grailsApplication.getDomainClass(detail.className).name.substring(1))+'.label') + ' (id '+detail.entityId+')'}
					</h5>
				
				
				</g:each>
				</td>
				
			</tr>
		
		</tbody>
	</table>
		
</section>

</body>

</html>
