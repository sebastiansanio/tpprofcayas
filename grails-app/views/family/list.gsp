
<%@ page import="product.Family" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-family" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="description" title="${message(code: 'family.description.label', default: 'Description')}" />
				<g:sortableColumn property="margin" title="${message(code: 'family.margin.label', default: 'Description')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${familyInstanceList}" status="i" var="familyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${familyInstance.id}">${fieldValue(bean: familyInstance, field: "description")}</g:link></td>
				<td>${fieldValue(bean: familyInstance, field: "margin")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${familyInstanceTotal}" />
	</div>
</section>

</body>

</html>
