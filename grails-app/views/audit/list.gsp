
<%@ page import="audit.RevisionInformation" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'audit.label', default: 'Audit')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-revisionInformation" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				
				<th><g:message code="default.view.label" default="View" /></th>
				
				<th><g:message code="revisionInformation.currentUser.label" default="Current User" /></th>
			
				<g:sortableColumn property="timestamp" title="${message(code: 'revisionInformation.timestamp.label', default: 'Timestamp')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${revisionInformationInstanceList}" status="i" var="revisionInformationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${revisionInformationInstance.id}"><i class="icon-eye-open"></i></g:link></td>
			
				<td>${fieldValue(bean: revisionInformationInstance, field: "currentUser")}</td>
			
				<td><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${revisionInformationInstance.timestamp}" /></td>
			
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
