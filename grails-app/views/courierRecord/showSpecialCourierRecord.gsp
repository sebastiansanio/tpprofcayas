
<%@ page import="courier.SpecialCourierRecord" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'specialCourierRecord.label', default: 'SpecialCourierRecord')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-specialCourierRecord" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.courier.label" default="Courier" /></td>
				
				<td valign="top" class="value"><g:link controller="courier" action="show" id="${specialCourierRecordInstance?.courier?.id}">${specialCourierRecordInstance?.courier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.trackingNumber.label" default="Tracking Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "trackingNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.departureDate.label" default="Departure Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.departureDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.estimatedArrivalDate.label" default="Estimated Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.estimatedArrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.arrivalDate.label" default="Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.arrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.costsInChargeOf.label" default="Costs In Charge Of" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "costsInChargeOf")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.aditionalCosts.label" default="Aditional Costs" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "aditionalCosts")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.observations.label" default="Observations" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "observations")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.issuer.label" default="Issuer" /></td>
				
				<td valign="top" class="value"><g:link controller="stakeholder" action="show" id="${specialCourierRecordInstance?.issuer?.id}">${specialCourierRecordInstance?.issuer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="specialCourierRecord.receivers.label" default="Receivers" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${specialCourierRecordInstance.receivers}" var="r">
						<li><g:link controller="stakeholder" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
