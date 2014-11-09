
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
				<td valign="top" class="name"><g:message code="courierRecord.courier.label" default="Courier" /></td>
				
				<td valign="top" class="value"><g:link controller="courier" action="show" id="${specialCourierRecordInstance?.courier?.id}">${specialCourierRecordInstance?.courier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.trackingNumber.label" default="Tracking Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "trackingNumber")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.source.label" default="Source" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "source")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.destination.label" default="Destination" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "destination")}</td>
				
			</tr>
			
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.departureDate.label" default="Departure Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.departureDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.estimatedArrivalDate.label" default="Estimated Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.estimatedArrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.arrivalDate.label" default="Arrival Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.arrivalDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.costsInChargeOf.label" default="Costs In Charge Of" /></td>
				
				<td valign="top" class="value"><g:message code="courierRecord.costsInChargeOf.${specialCourierRecordInstance.costsInChargeOf}" default="${specialCourierRecordInstance.costsInChargeOf}"/></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.aditionalCosts.label" default="Aditional Costs" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "aditionalCosts")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.observations.label" default="Observations" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "observations")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: specialCourierRecordInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.issuer.label" default="Issuer" /></td>
				
				<td valign="top" class="value"><g:link controller="${specialCourierRecordInstance?.issuer?.type}" action="show" id="${specialCourierRecordInstance?.issuer?.id}">${specialCourierRecordInstance?.issuer?.encodeAsHTML()}</g:link></td>
				
			</tr>
				
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.receivers.label" default="Receivers" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${specialCourierRecordInstance.receivers}" var="r">
						<li><g:link controller="${r.type }" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.requiresVisa.label" default="Requires Visa" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${specialCourierRecordInstance?.requiresVisa}" /></td>
				
			</tr>	
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courierRecord.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${specialCourierRecordInstance?.lastUpdated}" /></td>
				
			</tr>
		
		
		</tbody>
	</table>
</section>

</body>

</html>
