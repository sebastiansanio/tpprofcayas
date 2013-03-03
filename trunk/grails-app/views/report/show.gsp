
<%@ page import="report.Report" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-report" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reportInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reportInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.fields.label" default="Fields" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reportInstance, field: "fields")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reportInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.pendingOnly.label" default="Pending Only" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${reportInstance?.pendingOnly}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
