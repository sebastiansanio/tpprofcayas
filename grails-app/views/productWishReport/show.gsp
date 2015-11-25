
<%@ page import="report.ProductWishReport" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productWishReport.label', default: 'ProductWishReport')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-productWishReport" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWishReport.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productWishReportInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWishReport.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productWishReportInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWishReport.fields.label" default="Fields" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productWishReportInstance, field: "fields")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWishReport.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productWishReportInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
