
<%@ page import="modal.TypeOfFreight" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'typeOfFreight.label', default: 'TypeOfFreight')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-typeOfFreight" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'typeOfFreight.name.label', default: 'Name')}" />
				<g:sortableColumn property="requiresPicturesOfLoadingContainer" title="${message(code: 'typeOfFreight.requiresPicturesOfLoadingContainer.label')}" />
				
			</tr>
		</thead>
		<tbody>
		<g:each in="${typeOfFreightInstanceList}" status="i" var="typeOfFreightInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${typeOfFreightInstance.id}">${fieldValue(bean: typeOfFreightInstance, field: "name")}</g:link></td>
				<td><g:formatBoolean boolean="${typeOfFreightInstance.requiresPicturesOfLoadingContainer}"/></td>
				
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${typeOfFreightInstanceTotal}" />
	</div>
</section>

</body>

</html>
