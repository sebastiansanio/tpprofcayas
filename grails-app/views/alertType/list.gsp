
<%@ page import="alert.AlertType" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alertType.label', default: 'AlertType')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-alertType" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'alertType.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="nameOfEstimatedDateField" title="${message(code: 'alertType.nameOfEstimatedDateField.label', default: 'Name Of Estimated Date Field')}" />
			
				<g:sortableColumn property="nameOfCompletionField" title="${message(code: 'alertType.nameOfCompletionField.label', default: 'Name Of Completion Field')}" />
			
				<g:sortableColumn property="alertTerm" title="${message(code: 'alertType.alertTerm.label', default: 'Alert Term')}" />
			
				<g:sortableColumn property="frequency" title="${message(code: 'alertType.frequency.label', default: 'Frequency')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertTypeInstanceList}" status="i" var="alertTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${alertTypeInstance.id}">${fieldValue(bean: alertTypeInstance, field: "description")}</g:link></td>
			
				<td>${ message(code:'wish.'+alertTypeInstance.nameOfEstimatedDateField+'.label')}</td>
			
				<td>${ message(code:'wish.'+alertTypeInstance.nameOfCompletionField+'.label')}</td>
			
				<td>${fieldValue(bean: alertTypeInstance, field: "alertTerm")}</td>
			
				<td>${fieldValue(bean: alertTypeInstance, field: "frequency")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${alertTypeInstanceTotal}" />
	</div>
</section>

</body>

</html>
