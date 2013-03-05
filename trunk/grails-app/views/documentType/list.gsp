
<%@ page import="modal.DocumentType" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'documentType.label', default: 'DocumentType')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-documentType" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'documentType.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'documentType.type.label', default: 'Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${documentTypeInstanceList}" status="i" var="documentTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${documentTypeInstance.id}">${fieldValue(bean: documentTypeInstance, field: "name")}</g:link></td>
			
				<td>${message(code:documentTypeInstance.type)}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	
		${DocumentType.list().findAll{it.isPhase2()}}
	
	<div class="pagination">
		<bs:paginate total="${documentTypeInstanceTotal}" />
	</div>
</section>

</body>

</html>
