
<%@ page import="wish.Picture" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'picture.label', default: 'Picture')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-picture" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="image" title="${message(code: 'picture.image.label', default: 'Image')}" />
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${pictureInstanceList}" status="i" var="pictureInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${pictureInstance.id}">${fieldValue(bean: pictureInstance, field: "description")}</g:link></td>
			
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${pictureInstanceTotal}" />
	</div>
</section>

</body>

</html>
