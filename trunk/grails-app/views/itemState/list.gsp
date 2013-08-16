
<%@ page import="product.ItemState" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'itemState.label', default: 'ItemState')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-itemState" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'itemState.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'itemState.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'itemState.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${itemStateInstanceList}" status="i" var="itemStateInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${itemStateInstance.id}">${fieldValue(bean: itemStateInstance, field: "dateCreated")}</g:link></td>
			
				<td>${fieldValue(bean: itemStateInstance, field: "description")}</td>
			
				<td><g:formatDate date="${itemStateInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${itemStateInstanceTotal}" />
	</div>
</section>

</body>

</html>
