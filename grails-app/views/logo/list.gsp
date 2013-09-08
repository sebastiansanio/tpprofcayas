
<%@ page import="helper.Logo" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logo.label', default: 'Logo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-logo" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'logo.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="image" title="${message(code: 'logo.image.label', default: 'Image')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${logoInstanceList}" status="i" var="logoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${logoInstance.id}">${fieldValue(bean: logoInstance, field: "name")}</g:link></td>
			
				<td><img style="height:140px;" src="${createLink(controller:'logo',action:'viewLogo',id:logoInstance.id)}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${logoInstanceTotal}" />
	</div>
</section>

</body>

</html>
