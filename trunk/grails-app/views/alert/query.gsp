<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alert.label', default: 'Alert')}" />
	<title><g:message code="default.query.label" args="[entityName]" /></title>
</head>

<body>
	

<h4> <g:message code="export.label" default="Export" /> </h4>

<g:form action="export">

<div class="row-fluid">

<div class="span3">
	
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

<div class="offset1 span2">
	<div class="btn-toolbar">
	<button class="btn span12" type="button" onClick="setToday();">${message(code:'default.today.label')}</button>
	<button class="btn span12" type="button" onClick="setTomorrow();">${message(code:'default.tomorrow.label')}</button>
	<button class="btn span12" type="button" onClick="setThisWeek();">${message(code:'default.thisWeek.label')}</button>
	<button class="btn span12" type="button" onClick="setNextWeek();">${message(code:'default.nextWeek.label')}</button>
	<button class="btn span12" type="button" onClick="setThisMonth();">${message(code:'default.thisMonth.label')}</button>
	<button class="btn span12" type="button" onClick="setNextMonth();">${message(code:'default.nextMonth.label')}</button>
	<button class="btn span12" type="button" onClick="setAll();">${message(code:'default.all.label')}</button>
	</div>

</div>
</div>

	
<div class="row">
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
	changeDatepicker(new Date(),new Date());
}

function setTomorrow(){
	changeDatepicker(new Date(new Date().getTime()+24*60*60*1000),new Date(new Date().getTime()+24*60*60*1000))
}

function setThisWeek(){
	var today = new Date();
	var day = today.getDay();
	var diff = today.getDate() - day + (day == 0 ? -6:1);
	var monday = new Date(today.setDate(diff));
	var sunday = new Date(monday.getTime()+24*60*60*1000*6);
	
	changeDatepicker(monday,sunday);	
}

function setNextWeek(){
	var today = new Date();
	var day = today.getDay();
	var diff = today.getDate() - day + (day == 0 ? -6:1);
	var monday = new Date(today.setDate(diff)+24*60*60*1000*7);
	var sunday = new Date(monday.getTime()+24*60*60*1000*6);
	
	changeDatepicker(monday,sunday);	
}

function setThisMonth(){
	var today = new Date();
	var firstDay = new Date(today.getFullYear(),today.getMonth(), 1);

	if(today.getMonth() == 1){
		var lastDay = new Date(today.getFullYear()+1,0,1);
	} else{
		var lastDay = new Date(new Date(today.getFullYear(),today.getMonth()+1,1).getTime()-24*60*60*1000);
	}
	changeDatepicker(firstDay,lastDay);
}

function setNextMonth(){
	var today = new Date();
	if(today.getMonth() == 1){
		var firstDay = new Date(today.getFullYear()+1,0,1);
	} else{
		var firstDay = new Date(new Date(today.getFullYear(),today.getMonth()+1,1).getTime());
	}
	if(firstDay.getMonth() == 1){
		var lastDay = new Date(firstDay.getFullYear()+1,0,1);
	} else{
		var lastDay = new Date(new Date(firstDay.getFullYear(),firstDay.getMonth()+1,1).getTime()-24*60*60*1000);
	}
	
	changeDatepicker(firstDay,lastDay);
}

function setAll(){

	var today = new Date();
	var firstDay = new Date(2010,0,1);
	var lastDay = new Date(today.getFullYear()+2,11,31);
	changeDatepicker(firstDay,lastDay);
}

</script>


</body>

</html>
