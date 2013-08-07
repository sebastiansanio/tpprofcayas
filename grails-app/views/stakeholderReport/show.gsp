
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
<div class="row-fluid">
<div class="span8">

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
</div>

<div class="span4">

<h4> <g:message code="export.label" default="Export" /> </h4>
<g:form action="export" method="POST">
	<g:hiddenField name="reportId" value="${stakeholderReportInstance?.id}"/>
	<g:hiddenField id="exportFormat" name="format" />
	<g:hiddenField id="exportExtension" name="extension" />
	
	<div class='export'>
		<button type="submit" onclick="$('#exportFormat').val('csv');$('#exportExtension').val('csv');">
		<img src="${resource(dir: 'images/skin',file: 'csv.png')}"/> CSV
		</button>
		<button type="submit" onclick="$('#exportFormat').val('excel');$('#exportExtension').val('xls');">
		<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
		</button>
		<button type="submit" onclick="$('#exportFormat').val('ods');$('#exportExtension').val('ods');">
		<img src="${resource(dir: 'images/skin',file: 'ods.png')}"/> ODS
		</button>
		<button type="submit" onclick="$('#exportFormat').val('pdf');$('#exportExtension').val('pdf');" >
		<img src="${resource(dir: 'images/skin',file: 'pdf.png')}"/> PDF
		</button>
	</div>
</g:form>

</div>

</div>
</section>


</body>

</html>
