
<%@ page import="modal.TypeOfFreight" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'typeOfFreight.label', default: 'TypeOfFreight')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-typeOfFreight" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="typeOfFreight.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: typeOfFreightInstance, field: "name")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="typeOfFreight.requiresPicturesOfLoadingContainer.label"/></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${typeOfFreightInstance.requiresPicturesOfLoadingContainer}"/></td>
				
			</tr>

		
		</tbody>
	</table>
</section>

</body>

</html>
