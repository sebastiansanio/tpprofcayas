
<%@ page import="report.ReportSendConfiguration" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-reportSendConfiguration" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="nextSendDate" title="${message(code: 'reportSendConfiguration.nextSendDate.label', default: 'Next Send Date')}" />
			
				<g:sortableColumn property="lastSentDate" title="${message(code: 'reportSendConfiguration.lastSentDate.label', default: 'Last Sent Date')}" />
			
			
				<g:sortableColumn property="frequencyInDays" title="${message(code: 'reportSendConfiguration.frequencyInDays.label', default: 'Frequency In Days')}" />
			
				<th><g:message code="reportSendConfiguration.stakeholder.label" default="Stakeholder" /></th>
			
				<th><g:message code="reportSendConfiguration.active.label" default="Active" /></th>
			
			
				<g:sortableColumn property="subject" title="${message(code: 'reportSendConfiguration.subject.label', default: 'Subject')}" />

			
			
				<th><g:message code="reportSendConfiguration.report.label" default="Report" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${reportSendConfigurationInstanceList}" status="i" var="reportSendConfigurationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${reportSendConfigurationInstance.id}">${fieldValue(bean: reportSendConfigurationInstance, field: "nextSendDate")}</g:link></td>
			
				<td>${fieldValue(bean: reportSendConfigurationInstance, field: "lastSentDate")}</td>
			
				<td>${fieldValue(bean: reportSendConfigurationInstance, field: "frequencyInDays")}</td>
			
				<td>${fieldValue(bean: reportSendConfigurationInstance, field: "stakeholder")}</td>
			
				<td> <g:formatBoolean boolean="${reportSendConfigurationInstance.active}" /></td>
			
				<td>${fieldValue(bean: reportSendConfigurationInstance, field: "subject")}</td>
			
				
			
				<td>${fieldValue(bean: reportSendConfigurationInstance, field: "report")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${reportSendConfigurationInstanceTotal}" />
	</div>
</section>

</body>

</html>
