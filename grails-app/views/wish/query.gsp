<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.query.label" args="[entityName]" /></title>
</head>

<body>
	

<h4> <g:message code="export.label" default="Export" /> </h4>
<g:form>


	<g:message code="report.label" default="Report" />
	<g:select id="reportId" name="reportId" from="${Report.list()}" optionKey="id" />
	
	
<div class='export'>


	<button type="submit" formaction='export?format=csv&amp;extension=csv' >
	<img src="${resource(dir: 'images/skin',file: 'csv.png')}"/> CSV
	</button>
	
	<button type="submit" formaction='export?format=excel&amp;extension=xls' >
	<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
	</button>
	
	<button type="submit" formaction='export?format=ods&amp;extension=ods' >
	<img src="${resource(dir: 'images/skin',file: 'ods.png')}"/> ODS
	</button>

	<button type="submit" formaction='export?format=pdf&amp;extension=pdf' >
	<img src="${resource(dir: 'images/skin',file: 'pdf.png')}"/> PDF
	</button>
	

</div>

</g:form>


</body>

</html>
