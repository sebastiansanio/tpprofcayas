<%@ page import="report.Report" %>

<h4> <g:message code="wishes.label" default="Orders" /> </h4>

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


<h4> <g:message code="alerts.label" default="Alerts" /> </h4>

<g:form controller="alert" action="exportByStakeholder">

<g:hiddenField name="id" value="${stakeholderInstance.id}" />

	<g:hiddenField id="exportFormatAlert" name="format" />
	<g:hiddenField id="exportExtensionAlert" name="extension" />

<div>
	<button type="submit" onclick="$('#exportFormatAlert').val('csv');$('#exportExtensionAlert').val('csv');">
	<img src="${resource(dir: 'images/skin',file: 'csv.png')}"/> CSV
	</button>
	<button type="submit" onclick="$('#exportFormatAlert').val('excel');$('#exportExtensionAlert').val('xls');">
	<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
	</button>
	<button type="submit" onclick="$('#exportFormatAlert').val('ods');$('#exportExtensionAlert').val('ods');">
	<img src="${resource(dir: 'images/skin',file: 'ods.png')}"/> ODS
	</button>
	<button type="submit" onclick="$('#exportFormatAlert').val('pdf');$('#exportExtensionAlert').val('pdf');" >
	<img src="${resource(dir: 'images/skin',file: 'pdf.png')}"/> PDF
	</button>
</div>
</g:form>
