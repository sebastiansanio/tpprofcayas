
<%@ page import="modal.DocumentType" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'documentType.label', default: 'DocumentType')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-documentType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentType.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentTypeInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentType.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${message(code:'documentType.'+documentTypeInstance.type+'.label')}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
