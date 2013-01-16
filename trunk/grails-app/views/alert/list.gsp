
<%@ page import="alert.Alert" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alert.label', default: 'Alert')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-alert" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="alert.alertType.label" default="Alert Type" /></th>
			
				<th><g:message code="alert.wish.label" default="Wish" /></th>
			
				<g:sortableColumn property="deadline" title="${message(code: 'alert.deadline.label', default: 'Deadline')}" />
			
				<th><g:message code="wish.alertsQuantity.label" default="Alerts Quantity" /></th>
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertInstanceList}" status="i" var="alertInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: alertInstance, field: "alertType")}</td>
			
				<td><g:link controller="wish" action="show" id="${alertInstance.wish.id}">${fieldValue(bean: alertInstance, field: "wish")}</g:link></td>
			
				<td><g:formatDate format="dd/MM/yyyy" date="${alertInstance.deadline}" /></td>
			
				<td>${alertInstance.wish.getActiveAlerts().size()}</td>
			
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${alertInstanceTotal}" />
	</div>
</section>

</body>

</html>
