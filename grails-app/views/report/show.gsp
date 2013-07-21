
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
<div class="row-fluid">

<div class="span8">
	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reportInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.fields.label" default="Fields" /></td>
				
				<td valign="top" class="value">
				
				<g:each in="${reportInstance.fields}" var="s">
						<li>${message(code:"wish."+s+".label")}</li>
				</g:each>
				
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="report.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reportInstance?.dateCreated}" /></td>
				
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
</div>
<div class="span4">

<h4> <g:message code="export.label" default="Export" /> </h4>
<g:form>
	<g:hiddenField name="reportId" value="${reportInstance?.id}"/>
	<div class='export'>
		<button type="submit" formaction='../export?format=csv&amp;extension=csv' >
		<img src="${resource(dir: 'images/skin',file: 'csv.png')}"/> CSV
		</button>
		<button type="submit" formaction='../export?format=excel&amp;extension=xls' >
		<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
		</button>
		<button type="submit" formaction='../export?format=ods&amp;extension=ods' >
		<img src="${resource(dir: 'images/skin',file: 'ods.png')}"/> ODS
		</button>
		<button type="submit" formaction='../export?format=pdf&amp;extension=pdf' >
		<img src="${resource(dir: 'images/skin',file: 'pdf.png')}"/> PDF
		</button>
	</div>
</g:form>


</div>
</div>
</section>


</body>

</html>
