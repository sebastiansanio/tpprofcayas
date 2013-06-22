
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
				<td valign="top" class="name"><g:message code="documentsCourierRecord.courier.label" default="Courier" /></td>
				
				<td valign="top" class="value"><g:link controller="courier" action="show" id="${documentsCourierRecordInstance?.courier?.id}">${documentsCourierRecordInstance?.courier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.trackingNumber.label" default="Tracking Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "trackingNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.departureDate.label" default="Departure Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.departureDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.estimatedArrivalDate.label" default="Estimated Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.estimatedArrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.arrivalDate.label" default="Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.arrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.costsInChargeOf.label" default="Costs In Charge Of" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "costsInChargeOf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.aditionalCosts.label" default="Aditional Costs" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "aditionalCosts")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.observations.label" default="Observations" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: documentsCourierRecordInstance, field: "observations")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.documents.label" default="Documents" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${documentsCourierRecordInstance.documents}" var="d">
						<li><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="documentsCourierRecord.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${documentsCourierRecordInstance?.lastUpdated}" /></td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
