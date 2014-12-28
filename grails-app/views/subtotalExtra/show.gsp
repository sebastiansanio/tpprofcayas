
<%@ page import="wish.SubtotalExtra" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subtotalExtra.label', default: 'SubtotalExtra')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-subtotalExtra" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subtotalExtra.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subtotalExtraInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subtotalExtra.number.label" default="Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subtotalExtraInstance, field: "number")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
