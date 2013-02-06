
<%@ page import="modal.PriceCondition" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceCondition.label', default: 'PriceCondition')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-priceCondition" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'priceCondition.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'priceCondition.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${priceConditionInstanceList}" status="i" var="priceConditionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${priceConditionInstance.id}">${fieldValue(bean: priceConditionInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: priceConditionInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${priceConditionInstanceTotal}" />
	</div>
</section>

</body>

</html>
