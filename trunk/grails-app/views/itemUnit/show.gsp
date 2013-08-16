
<%@ page import="product.ItemUnit" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'itemUnit.label', default: 'ItemUnit')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-itemUnit" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="itemUnit.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${itemUnitInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="itemUnit.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemUnitInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="itemUnit.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${itemUnitInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
