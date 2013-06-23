
<%@ page import="courier.DocumentsCourierRecord" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'documentsCourierRecord.label', default: 'DocumentsCourierRecord')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-documentsCourierRecord" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.courier.label" default="Courier" /></td>
				
				<td valign="top" class="value"><g:link controller="courier" action="show" id="${documentsCourierRecordInstance?.courier?.id}">${documentsCourierRecordInstance?.courier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.trackingNumber.label" default="Tracking Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "trackingNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.departureDate.label" default="Departure Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.departureDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.estimatedArrivalDate.label" default="Estimated Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.estimatedArrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.arrivalDate.label" default="Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.arrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.costsInChargeOf.label" default="Costs In Charge Of" /></td>
				
				<td valign="top" class="value"><g:message code="courierRecord.costsInChargeOf.${documentsCourierRecordInstance.costsInChargeOf}" default="${documentsCourierRecordInstance.costsInChargeOf}"/></td>

			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.aditionalCosts.label" default="Aditional Costs" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "aditionalCosts")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.observations.label" default="Observations" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "observations")}</td>
				
			</tr>
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.documents.label" default="Documents" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${documentsCourierRecordInstance.documents}" var="d">
						<li><g:link controller="wish" action="show" id="${d.wish?.id}"> ${d.toString() + ' (' + message(code:'wish.opNumber.label',default:'Op Number')+ ' '+ d.wish?.opNumber +')'}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.dateCreated}" /></td>
				
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.lastUpdated}" /></td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
