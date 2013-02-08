
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
			
				<g:sortableColumn property="deadline" title="${message(code: 'alert.deadline.label', default: 'Deadline')}" />
			
				<th><g:message code="alert.wish.label" default="Wish" /></th>
			
			
				<th><g:message code="alert.alertsQuantity.label" default="Alerts Quantity" /></th>
	
				<th><g:message code="alert.doInspect.label" default="Inspected" /></th>
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertInstanceList}" status="i" var="alertInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: alertInstance, field: "alertType")}</td>
			
				<td><g:formatDate format="dd/MM/yyyy" date="${alertInstance.deadline}" /></td>
			
				<td><g:link controller="wish" action="show" id="${alertInstance.wish.id}">${fieldValue(bean: alertInstance, field: "wish")}</g:link></td>			
			
				<td> <a href="#" class="popoverAlerts" rel="popover" data-content="<div><% alertInstance.wish.getActiveAlerts().each{out.println(it.deadline.format("dd/MM/yyyy")+": "+it.toString())} %>" data-original-title="Alertas activas" >${alertInstance.wish.getActiveAlerts().size()}</a></td>
			 
			 	<td> <g:link controller="alert" action="inspected" id="${alertInstance.id}">X</g:link> </td>
			 
			 
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${alertInstanceTotal}" />
	</div>
</section>

<script>
$(function()
		{ $(".popoverAlerts").popover({template: '<div class="popover span3"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'});
});
</script>
</body>



</html>
