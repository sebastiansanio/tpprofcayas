
<%@ page import="report.StakeholderReport" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'stakeholderReport.label', default: 'StakeholderReport')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-stakeholderReport" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'report.name.label', default: 'Name')}" />

				<g:sortableColumn property="pendingOnly" title="${message(code: 'report.pendingOnly.label', default: 'Pending Only')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'report.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'report.lastUpdated.label', default: 'Last Updated')}" />
			
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${stakeholderReportInstanceList}" status="i" var="stakeholderReportInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${stakeholderReportInstance.id}">${fieldValue(bean: stakeholderReportInstance, field: "name")}</g:link></td>

				<td><g:formatBoolean boolean="${stakeholderReportInstance.pendingOnly}" /></td>
			
				<td><g:formatDate date="${stakeholderReportInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${stakeholderReportInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${stakeholderReportInstanceTotal}" />
	</div>
</section>

</body>

</html>
