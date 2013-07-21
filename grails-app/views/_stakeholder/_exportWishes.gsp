<%@ page import="report.Report" %>

<h4> <g:message code="export.label" default="Export" /> </h4>

<g:form controller="wish" action="exportByStakeholder">

<g:message code="report.label" default="Report" />
<g:select id="reportId" name="reportId" from="${Report.list()}" value="${stakeholderInstance.defaultReport.id}" optionKey="id" />
<g:hiddenField name="id" value="${stakeholderInstance.id}" />

	<g:hiddenField id="exportFormat" name="format" />
	<g:hiddenField id="exportExtension" name="extension" />

<div>
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
