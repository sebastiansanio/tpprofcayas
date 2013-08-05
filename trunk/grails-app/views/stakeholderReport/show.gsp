
<%@ page import="report.StakeholderReport" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'stakeholderReport.label', default: 'StakeholderReport')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-stakeholderReport" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: stakeholderReportInstance, field: "name")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.fields.label" default="Fields" /></td>
				
				<td valign="top" class="value">
								
					<g:each in="${stakeholderReportInstance.fields}" var="s">
							<li>${message(code:"wish."+s+".label")}</li>
					</g:each>
				</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.pendingOnly.label" default="Pending Only" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${stakeholderReportInstance?.pendingOnly}" /></td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.label" default="Stakeholder" /></td>
				
				<td valign="top" class="value">${stakeholderReportInstance?.stakeholder?.encodeAsHTML()}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${stakeholderReportInstance?.dateCreated}" /></td>
				
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${stakeholderReportInstance?.lastUpdated}" /></td>
				
			</tr>

		
		</tbody>
	</table>
</section>

</body>

</html>
