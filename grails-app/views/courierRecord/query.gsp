<%@ page import="courier.CourierRecord" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'courierRecord.label', default: 'CourierRecord')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	

<h4> <g:message code="export.label" default="Export" /> </h4>

<g:form>

<div class="row-fluid">

<div class="span4">

	
	<div class="control-group fieldcontain">
		<label for="pendingOnly" class="control-label"><g:message code="report.pendingOnly.label" default="Pending Only?" /></label>
		<div class="controls">
			<bs:checkBox name="pendingOnly" value="true" />

		</div>
	</div>
	

</div>

</div>

	
<div class="row">
<div class='span4 export'>


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
</div>
</g:form>

</body>

</html>
