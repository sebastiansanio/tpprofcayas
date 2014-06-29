
<%@ page import="product.SubFamily" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subFamily.label', default: 'SubFamily')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-subFamily" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="description" title="${message(code: 'subFamily.description.label', default: 'Description')}" />
			
				<th><g:message code="subFamily.family.label" default="Family" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${subFamilyInstanceList}" status="i" var="subFamilyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${subFamilyInstance.id}">${fieldValue(bean: subFamilyInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: subFamilyInstance, field: "family")}</td>
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
