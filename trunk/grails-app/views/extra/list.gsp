
<%@ page import="product.Extra" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'extra.label', default: 'Extra')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-extra" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'extra.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="equation" title="${message(code: 'extra.equation.label', default: 'Equation')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${extraInstanceList}" status="i" var="extraInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${extraInstance.id}">${fieldValue(bean: extraInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: extraInstance, field: "equation")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${extraInstanceTotal}" />
	</div>
</section>

</body>

</html>
