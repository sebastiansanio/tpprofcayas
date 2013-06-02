
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
				<g:sortableColumn property="attentionDate" title="${message(code: 'alert.attentionDate.label', default: 'Attention Date')}" />

			
				<th><g:message code="alert.alertType.label" default="Alert Type" /></th>
			
				<th><g:message code="alert.wish.label" default="Wish" /></th>
			
				<g:sortableColumn property="deadline" title="${message(code: 'alert.deadline.label', default: 'Deadline')}" />
			
			
				<g:if test="${params.action =='list'}">				
					<th><g:message code="alert.doInspect.label" default="Inspected" /> </th>
				</g:if>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertInstanceList}" status="i" var="alertInstance">
		
			<tr class="${alertInstance.isActive() && !alertInstance.isInspected() && alertInstance.attentionDate.compareTo(new Date().clearTime())<=0 ? 'error' :((i % 2) == 0 ? 'odd' : 'even')}">

				<td><g:formatDate date="${alertInstance.attentionDate}" /></td>
			
				<td>${fieldValue(bean: alertInstance, field: "alertType")}</td>
			
				<td><g:link action="show" controller="wish" id="${alertInstance.wish.id}">${fieldValue(bean: alertInstance, field: "wish")}</g:link></td>
			
				<td><g:formatDate date="${alertInstance.deadline}" /></td>
			
				
			 	<g:if test="${params.action =='list'}">		
					<td> <g:link controller="alert" action="inspected" id="${alertInstance.id}">X</g:link></td>
				</g:if>
			
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
