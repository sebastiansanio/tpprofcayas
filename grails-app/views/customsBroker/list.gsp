
<%@ page import="stakeholder.CustomsBroker" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customsBroker.label', default: 'CustomsBroker')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-customsBroker" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'customsBroker.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'customsBroker.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'customsBroker.email.label', default: 'Email')}" />
			
				<th><g:message code="customsBroker.country.label" default="Country" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'customsBroker.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'customsBroker.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customsBrokerInstanceList}" status="i" var="customsBrokerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customsBrokerInstance.id}">${fieldValue(bean: customsBrokerInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: customsBrokerInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: customsBrokerInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: customsBrokerInstance, field: "country")}</td>
			
				<td><g:formatDate date="${customsBrokerInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${customsBrokerInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${customsBrokerInstanceTotal}" />
	</div>
</section>

</body>

</html>
