
<%@ page import="modal.CriterionValue" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'criterionValue.label', default: 'CriterionValue')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-criterionValue" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'criterionValue.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${criterionValueInstanceList}" status="i" var="criterionValueInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${criterionValueInstance.id}">${fieldValue(bean: criterionValueInstance, field: "name")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${criterionValueInstanceTotal}" />
	</div>
</section>

</body>

</html>
