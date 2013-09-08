
<%@ page import="helper.Logo" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logo.label', default: 'Logo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-logo" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logo.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logoInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logo.image.label" default="Image" /></td>
				
				<td> <img src="${createLink(controller:'logo',action:'viewLogo',id:logoInstance.id)}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
