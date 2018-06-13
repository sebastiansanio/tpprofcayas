
<%@ page import="prices.CustomerGroup" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerGroup.label', default: 'CustomerGroup')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-customerGroup" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'customerGroup.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'customerGroup.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'customerGroup.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerGroupInstanceList}" status="i" var="customerGroupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customerGroupInstance.id}">${fieldValue(bean: customerGroupInstance, field: "name")}</g:link></td>
			
				<td><g:formatDate date="${customerGroupInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${customerGroupInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${customerGroupInstanceTotal}" />
	</div>
</section>

</body>

</html>
