
<%@ page import="stakeholder.Shipper" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shipper.label', default: 'Shipper')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-shipper" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${shipperInstance?.country?.id}">${shipperInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${shipperInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${shipperInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
