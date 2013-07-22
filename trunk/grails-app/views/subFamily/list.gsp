
<%@ page import="product.SubFamily" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subFamily.label', default: 'SubFamily')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-subFamily" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
				<g:sortableColumn property="description" title="${message(code: 'subFamily.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'subFamily.dateCreated.label', default: 'Date Created')}" />			
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'subFamily.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${subFamilyInstanceList}" status="i" var="subFamilyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${subFamilyInstance.id}">${fieldValue(bean: subFamilyInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: subFamilyInstance, field: "dateCreated")}</td>
			
				<td><g:formatDate date="${subFamilyInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${subFamilyInstanceTotal}" />
	</div>
</section>

</body>

</html>
