
<%@ page import="alert.AlertMessage" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alertMessage.label', default: 'AlertMessage')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
	
</head>

<body>
	
<section id="list-alertMessage" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="message" title="${message(code: 'alertMessage.message.label', default: 'Message')}" />
			
				<th><g:message code="alertMessage.language.label" default="Language" /></th>
			
				<th><g:message code="alertMessage.alertType.label" default="Alert Type" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'alertMessage.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'alertMessage.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertMessageInstanceList}" status="i" var="alertMessageInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${alertMessageInstance.id}">${fieldValue(bean: alertMessageInstance, field: "message")}</g:link></td>
			
				<td>${fieldValue(bean: alertMessageInstance, field: "language")}</td>
			
				<td>${fieldValue(bean: alertMessageInstance, field: "alertType")}</td>
			
				<td><g:formatDate date="${alertMessageInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${alertMessageInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${alertMessageInstanceTotal}" />
	</div>
</section>

</body>

</html>
