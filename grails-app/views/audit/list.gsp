
<%@page import="org.hibernate.envers.RevisionType"%>
<%@ page import="audit.RevisionInformation" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'audit.label', default: 'Audit')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<g:link class="btn" controller="audit" action="listLogins"><g:message code="listLogins.label" /></g:link>
	
<section id="list-revisionInformation" class="first">

	<table class="table table-bordered table-condensed cabeceraFija">
		<thead>
			<tr>
				
				<th><g:message code="revisionInformation.id.label" default="Revision" /></th>
				
				<th><g:message code="revisionInformation.currentUser.label" default="Current User" /></th>
			
				<g:sortableColumn property="timestamp" title="${message(code: 'revisionInformation.timestamp.label', default: 'Timestamp')}" />

				<th><g:message code="revisionInformation.details.label" default="Details" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${revisionInformationInstanceList}" status="i" var="revisionInformationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${revisionInformationInstance.id}">${revisionInformationInstance.id}</g:link></td>
			
				<td>${fieldValue(bean: revisionInformationInstance, field: "currentUser")}</td>
			
				<td><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${revisionInformationInstance.timestamp}" /></td>

				<td>
				<g:each in="${revisionInformationInstance.details.sort{it.id}}" var="detail">
				<p>
				${message(code:'revisionType.'+detail.revisionType.toString().toLowerCase()+'.label') + ' '+ message(code:(grailsApplication.getDomainClass(detail.className).name.substring(0,1).toLowerCase() + grailsApplication.getDomainClass(detail.className).name.substring(1))+'.label') + ' (id '+detail.entityId+')'}
				</p>
				</g:each>
				
				</td>

			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${revisionInformationInstanceTotal}" />
	</div>
</section>

</body>

</html>
