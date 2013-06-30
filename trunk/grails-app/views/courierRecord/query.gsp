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
