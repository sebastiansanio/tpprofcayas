
<%@ page import="product.Product" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-product" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.descriptionES.label" default="Description ES" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "descriptionES")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.color.label" default="Color" /></td>
				
				<td valign="top" class="value"><g:link controller="color" action="show" id="${productInstance?.color?.id}">${productInstance?.color?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.family.label" default="Family" /></td>
				
				<td valign="top" class="value"><g:link controller="family" action="show" id="${productInstance?.family?.id}">${productInstance?.family?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.subFamily.label" default="Sub Family" /></td>
				
				<td valign="top" class="value"><g:link controller="subFamily" action="show" id="${productInstance?.subFamily?.id}">${productInstance?.subFamily?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.lastUpdated}" /></td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
