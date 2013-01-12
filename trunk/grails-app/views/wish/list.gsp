
<%@ page import="wish.Wish" %>
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
			
				<g:sortableColumn property="estimatedDeliveryDate" title="${message(code: 'wish.estimatedDeliveryDate.label', default: 'Estimated Delivery Date')}" />
			
				<th><g:message code="wish.agent.label" default="Agent" /></th>
			
				<g:sortableColumn property="amountOfMoneyInAdvanceTransferred" title="${message(code: 'wish.amountOfMoneyInAdvanceTransferred.label', default: 'Amount Of Money In Advance Transferred')}" />
			
				<g:sortableColumn property="bill" title="${message(code: 'wish.bill.label', default: 'Bill')}" />
			
				<g:sortableColumn property="blNumber" title="${message(code: 'wish.blNumber.label', default: 'Bl Number')}" />
			
				<g:sortableColumn property="cartonPrintingInfo" title="${message(code: 'wish.cartonPrintingInfo.label', default: 'Carton Printing Info')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishInstanceList}" status="i" var="wishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${wishInstance.id}">${fieldValue(bean: wishInstance, field: "estimatedDeliveryDate")}</g:link></td>
			
				<td>${fieldValue(bean: wishInstance, field: "agent")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "amountOfMoneyInAdvanceTransferred")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "bill")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "blNumber")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "cartonPrintingInfo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${wishInstanceTotal}" />
	</div>
</section>

</body>

</html>
