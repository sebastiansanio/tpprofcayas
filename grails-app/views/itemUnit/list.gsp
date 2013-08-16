
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
			
				<g:sortableColumn property="description" title="${message(code: 'itemUnit.description.label', default: 'Description')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${itemUnitInstanceList}" status="i" var="itemUnitInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${itemUnitInstance.id}">${fieldValue(bean: itemUnitInstance, field: "description")}</g:link></td>

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
