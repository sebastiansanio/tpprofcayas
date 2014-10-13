
<%@ page import="wish.SubtotalExtra" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subtotalExtra.label', default: 'SubtotalExtra')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-subtotalExtra" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'subtotalExtra.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="equation" title="${message(code: 'subtotalExtra.equation.label', default: 'Equation')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${subtotalExtraInstanceList}" status="i" var="subtotalExtraInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${subtotalExtraInstance.id}">${fieldValue(bean: subtotalExtraInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: subtotalExtraInstance, field: "equation")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${subtotalExtraInstanceTotal}" />
	</div>
</section>

</body>

</html>
