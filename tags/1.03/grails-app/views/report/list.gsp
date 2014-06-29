
<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-report" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'report.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'report.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'report.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="pendingOnly" title="${message(code: 'report.pendingOnly.label', default: 'Pending Only')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${reportInstanceList}" status="i" var="reportInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${reportInstance.id}">${fieldValue(bean: reportInstance, field: "name")}</g:link></td>
			
				<td><g:formatDate date="${reportInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${reportInstance.lastUpdated}" /></td>
			
				<td><g:formatBoolean boolean="${reportInstance.pendingOnly}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${reportInstanceTotal}" />
	</div>
</section>

</body>

</html>
