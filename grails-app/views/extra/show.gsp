
<%@ page import="product.Extra" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'extra.label', default: 'Extra')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-extra" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="extra.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: extraInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="extra.equation.label" default="Equation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: extraInstance, field: "equation")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
