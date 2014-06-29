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

<g:form action="export" method="POST">

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

	<g:hiddenField id="exportFormat" name="format" />
	<g:hiddenField id="exportExtension" name="extension" />
<div class='span4 export'>

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
</div>
</g:form>

</body>

</html>
