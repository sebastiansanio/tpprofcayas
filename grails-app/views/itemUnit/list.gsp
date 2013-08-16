
<%@ page import="product.ItemUnit" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'itemUnit.label', default: 'ItemUnit')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-itemUnit" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'itemUnit.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'itemUnit.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'itemUnit.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${itemUnitInstanceList}" status="i" var="itemUnitInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${itemUnitInstance.id}">${fieldValue(bean: itemUnitInstance, field: "dateCreated")}</g:link></td>
			
				<td>${fieldValue(bean: itemUnitInstance, field: "description")}</td>
			
				<td><g:formatDate date="${itemUnitInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${itemUnitInstanceTotal}" />
	</div>
</section>

</body>

</html>
