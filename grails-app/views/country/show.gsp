
<%@ page import="modal.Country" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-country" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="country.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: countryInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="country.ports.label" default="Ports" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${countryInstance.ports}" var="p">
						<li><g:link controller="port" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
