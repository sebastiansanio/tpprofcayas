
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
	
<section id="list-courierRecord" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="trackingNumber" title="${message(code: 'courierRecord.trackingNumber.label', default: 'Tracking Number')}" />
			
				<th><g:message code="courierRecord.courier.label" default="Courier" /></th>
			
				<th><g:message code="courier.web.label" default="Web" /></th>
			
				<g:sortableColumn property="departureDate" title="${message(code: 'courierRecord.departureDate.label', default: 'Departure Date')}" />
			
				<g:sortableColumn property="estimatedArrivalDate" title="${message(code: 'courierRecord.estimatedArrivalDate.label', default: 'Estimated Arrival Date')}" />
			
				<g:sortableColumn property="arrivalDate" title="${message(code: 'courierRecord.arrivalDate.label', default: 'Arrival Date')}" />
			
				<g:sortableColumn property="costsInChargeOf" title="${message(code: 'courierRecord.costsInChargeOf.label', default: 'Costs In Charge Of')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${courierRecordInstanceList}" status="i" var="courierRecordInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${courierRecordInstance.id}">${fieldValue(bean: courierRecordInstance, field: "trackingNumber")}</g:link></td>
			
				<td><g:link controller="courier" action="show" id="${courierRecordInstance.courier.id}">${fieldValue(bean: courierRecordInstance, field: "courier")}</g:link></td>
			
				<td><a href="http://${courierRecordInstance.courier.web}" target="new">${courierRecordInstance.courier.web}</a></td>			
			
				<td><g:formatDate date="${courierRecordInstance.departureDate}" /></td>
			
				<td><g:formatDate date="${courierRecordInstance.estimatedArrivalDate}" /></td>
			
				<td><g:formatDate date="${courierRecordInstance.arrivalDate}" /></td>
			
				<td>${fieldValue(bean: courierRecordInstance, field: "costsInChargeOf")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${courierRecordInstanceTotal}" />
	</div>
</section>

</body>

</html>
