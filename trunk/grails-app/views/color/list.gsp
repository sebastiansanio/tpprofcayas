
<%@ page import="product.Color" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'color.label', default: 'Color')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-color" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="description" title="${message(code: 'color.description.label', default: 'Description')}" />

				<g:sortableColumn property="dateCreated" title="${message(code: 'color.dateCreated.label', default: 'Date Created')}" />			
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'color.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${colorInstanceList}" status="i" var="colorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${colorInstance.id}">${fieldValue(bean: colorInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: colorInstance, field: "dateCreated")}</td>
			
			
				<td><g:formatDate date="${colorInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${colorInstanceTotal}" />
	</div>
</section>

</body>

</html>
