
<%@ page import="wish.Wish" %>
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
	
<section id="list-wish" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="opNumber" title="${message(code: 'wish.opNumber.label', default: 'Op Number')}" />
			
				<g:sortableColumn property="customerOpNumber" title="${message(code: 'wish.customerOpNumber.label', default: 'Customer Op Number')}" />
			
				<th><g:message code="wish.customer.label" default="Customer" /></th>
			
				<th><g:message code="wish.supplier.label" default="Supplier" /></th>
			
				<th><g:message code="wish.shipper.label" default="Shipper" /></th>
			
				<g:sortableColumn property="supplierOrder" title="${message(code: 'wish.supplierOrder.label', default: 'Supplier Order')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishInstanceList}" status="i" var="wishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${wishInstance.id}">${fieldValue(bean: wishInstance, field: "opNumber")}</g:link></td>
			
				<td>${fieldValue(bean: wishInstance, field: "customerOpNumber")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "customer")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "supplier")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "shipper")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${wishInstanceTotal}" />
	</div>

	

</section>

<hr/>

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
