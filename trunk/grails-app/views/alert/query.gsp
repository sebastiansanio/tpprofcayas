<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alert.label', default: 'Alert')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	

<h4> <g:message code="export.label" default="Export" /> </h4>

<g:form>

<div class="row-fluid">

<div class="span4">


	
	<div class="control-group fieldcontain required">
		<label for="fromDate" class="control-label"><g:message code="default.fromDate.label" default="From date" /><span class="required-indicator">*</span></label>
		<div class="controls">
			<bs:datePicker name="fromDate" precision="day" />
		</div>
	</div>
	
	<div class="control-group fieldcontain required">
		<label for="toDate" class="control-label"><g:message code="default.toDate.label" default="To date" /><span class="required-indicator">*</span></label>
		<div class="controls">
			<bs:datePicker name="toDate" precision="day" />
		</div>
	</div>
	
	<div class="control-group fieldcontain">
		<label for="pendingOnly" class="control-label"><g:message code="report.pendingOnly.label" default="Pending Only?" /></label>
		<div class="controls">
			<bs:checkBox name="pendingOnly" value="true" />

		</div>
	</div>
	

</div>

<div class="row-fluid">

<div class="span5">

<p><button type="button" onClick="setToday();">${message(code:'default.today.label')}</button></p>
<p><button type="button" onClick="setTomorrow();">${message(code:'default.tomorrow.label')}</button></p>
<p><button type="button" onClick="setThisWeek();">${message(code:'default.thisWeek.label')}</button></p>
<p><button type="button" onClick="setNextWeek();">${message(code:'default.nextWeek.label')}</button></p>
<p><button type="button" onClick="setThisMonth();">${message(code:'default.thisMonth.label')}</button></p>
<p><button type="button" onClick="setNextMonth();">${message(code:'default.nextMonth.label')}</button></p>

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


<script>
function getDateString(aDate){

	var d = aDate.getDate();
	var m = aDate.getMonth() + 1;
	var y = aDate.getFullYear();
	var dateString = ''+ (d<=9? '0' + d : d ) + '/'+ (m<=9? '0' + m : m ) + '/' + y;
	return dateString;
}

function changeDatepicker(fromDate,toDate){
	$("#fromDate").val(getDateString(fromDate));
	$("#toDate").val(getDateString(toDate));
}

function setToday(){
	changeDatepicker(new Date(),new Date())
}


</script>


</body>

</html>
