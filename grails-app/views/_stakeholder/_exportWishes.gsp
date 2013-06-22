<%@ page import="report.Report" %>

<h4> <g:message code="export.label" default="Export" /> </h4>

<g:form>

<g:message code="report.label" default="Report" />
<g:select id="reportId" name="reportId" from="${Report.list()}" value="${stakeholderInstance.defaultReport.id}" optionKey="id" />
<g:hiddenField name="id" value="${stakeholderInstance.id}" />

<div>
	<button type="submit" formaction="${createLink(action:'exportByStakeholder',controller:'wish',params:[format:'csv',extension:'csv'])}" >
	<img src="${resource(dir: 'images/skin',file: 'csv.png')}"/> CSV
	</button>
	
	<button type="submit" formaction="${createLink(action:'exportByStakeholder',controller:'wish',params:[format:'excel',extension:'xls'])}" >
	<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
	</button>
	
	<button type="submit" formaction="${createLink(action:'exportByStakeholder',controller:'wish',params:[format:'ods',extension:'ods'])}" >
	<img src="${resource(dir: 'images/skin',file: 'ods.png')}"/> ODS
	</button>

	<button type="submit" formaction="${createLink(action:'exportByStakeholder',controller:'wish',params:[format:'pdf',extension:'pdf'])}" >
	<img src="${resource(dir: 'images/skin',file: 'pdf.png')}"/> PDF
	</button>
</div>
</g:form>
