<%@ page import="report.Report" %>
<%@ page import="modal.WishStatus" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wishStatus.label', default: 'WishStatus')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-wishStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wishStatus.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishStatusInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wishStatus.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishStatusInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wishStatus.wishes.label" default="Wishes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<h4> <g:message code="export.label" default="Export" /> </h4>

<g:form action="exportByWishStatus">

<g:message code="report.label" default="Report" />
<g:select id="reportId" name="reportId" from="${Report.list()}" optionKey="id" />
<g:hiddenField name="id" value="${wishStatusInstance.id}" />

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
					
				
					<ul>
					<g:each in="${wishStatusInstance.wishes.sort{it.opNumber}}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w.opNumber.toString() + ' - '+w.supplier.toString()+' > '+w.customer.toString() + (w.supplierOrder!=null?' ('+ w.supplierOrder +')':'')}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
