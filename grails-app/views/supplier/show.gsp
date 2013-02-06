
<%@ page import="stakeholder.Supplier" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-supplier" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.address.label" default="Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "address")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${supplierInstance?.country?.id}">${supplierInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${supplierInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${supplierInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.taxRegistryNumber.label" default="Tax Registry Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "taxRegistryNumber")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
