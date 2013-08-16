
<%@ page import="product.TypeOfPresentation" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-typeOfPresentation" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'typeOfPresentation.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'typeOfPresentation.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'typeOfPresentation.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${typeOfPresentationInstanceList}" status="i" var="typeOfPresentationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${typeOfPresentationInstance.id}">${fieldValue(bean: typeOfPresentationInstance, field: "dateCreated")}</g:link></td>
			
				<td>${fieldValue(bean: typeOfPresentationInstance, field: "description")}</td>
			
				<td><g:formatDate date="${typeOfPresentationInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${typeOfPresentationInstanceTotal}" />
	</div>
</section>

</body>

</html>
