
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
			
				<g:sortableColumn property="dateFinalized" title="${message(code: 'alert.dateFinalized.label', default: 'Date Finalized')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'alert.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertInstanceList}" status="i" var="alertInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${alertInstance.id}">${fieldValue(bean: alertInstance, field: "alertType")}</g:link></td>
			
				<td>${fieldValue(bean: alertInstance, field: "wish")}</td>
			
				<td><g:formatDate date="${alertInstance.dateFinalized}" /></td>
			
				<td><g:formatDate date="${alertInstance.dateCreated}" /></td>
			
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
