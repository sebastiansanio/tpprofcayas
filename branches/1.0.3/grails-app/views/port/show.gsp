
<%@ page import="modal.Port" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'port.label', default: 'Port')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-port" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="port.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${portInstance?.country?.id}">${portInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="port.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: portInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
