
<%@ page import="prices.PriceVariable" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceVariable.label', default: 'PriceVariable')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-priceVariable" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'priceVariable.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'priceVariable.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'priceVariable.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'priceVariable.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${priceVariableInstanceList}" status="i" var="priceVariableInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${priceVariableInstance.id}">${fieldValue(bean: priceVariableInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: priceVariableInstance, field: "description")}</td>
			
				<td><g:formatDate date="${priceVariableInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${priceVariableInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${priceVariableInstanceTotal}" />
	</div>
</section>

</body>

</html>
