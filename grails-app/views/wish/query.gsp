<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	

<h4> <g:message code="export.label" default="Export" /> </h4>
<g:form>


	<g:message code="report.label" default="Report" />
	<g:select id="reportId" name="reportId" from="${Report.list()}" optionKey="id" />
	
	
<div class='export'>


	<button type="submit" formaction='export?format=csv&amp;extension=csv' >
	<img src="../images/skin/csv.png"/> CSV
	</button>
	
	<button type="submit" formaction='export?format=excel&amp;extension=xls' >
	<img src="../images/skin/excel.png"/> EXCEL
	</button>
	
	<button type="submit" formaction='export?format=ods&amp;extension=ods' >
	<img src="../images/skin/ods.png"/> ODS
	</button>

	<button type="submit" formaction='export?format=pdf&amp;extension=pdf' >
	<img src="../images/skin/pdf.png"/> PDF
	</button>
	

</div>

</g:form>


</body>

</html>
