
<%@ page import="product.ItemState" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'itemState.label', default: 'ItemState')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-itemState" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="itemState.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${itemStateInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="itemState.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemStateInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="itemState.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${itemStateInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
