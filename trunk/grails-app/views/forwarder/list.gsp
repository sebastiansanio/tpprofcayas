
<%@ page import="stakeholder.Forwarder" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'forwarder.label', default: 'Forwarder')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-forwarder" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'forwarder.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'forwarder.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'forwarder.email.label', default: 'Email')}" />
			
				<th><g:message code="forwarder.country.label" default="Country" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'forwarder.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'forwarder.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${forwarderInstanceList}" status="i" var="forwarderInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${forwarderInstance.id}">${fieldValue(bean: forwarderInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: forwarderInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: forwarderInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: forwarderInstance, field: "country")}</td>
			
				<td><g:formatDate date="${forwarderInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${forwarderInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${forwarderInstanceTotal}" />
	</div>
</section>

</body>

</html>
