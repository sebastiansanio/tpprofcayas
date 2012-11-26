
<%@ page import="stakeholder.Person" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-person" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'person.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'person.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${personInstanceList}" status="i" var="personInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "dateCreated")}</g:link></td>
			
				<td><g:formatDate date="${personInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: personInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${personInstanceTotal}" />
	</div>
</section>

</body>

</html>
