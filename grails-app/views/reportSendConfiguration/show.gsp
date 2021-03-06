
<%@ page import="report.ReportSendConfiguration" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-reportSendConfiguration" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.nextSendDate.label" default="Next Send Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reportSendConfigurationInstance?.nextSendDate}" /></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.lastSentDate.label" default="Last Sent Date" /></td>
				
				<td valign="top" class="value"><g:formatDate format="dd/MM/yyy HH:mm" date="${reportSendConfigurationInstance?.lastSentDate}" /></td>
				
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.frequencyInDays.label" default="Frequency In Days" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reportSendConfigurationInstance, field: "frequencyInDays")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.stakeholder.label" default="Stakeholder" /></td>
				
				<td valign="top" class="value"><g:link controller="${reportSendConfigurationInstance?.stakeholder?.type }" action="show" id="${reportSendConfigurationInstance?.stakeholder?.id}">${reportSendConfigurationInstance?.stakeholder?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.contacts.label" default="Contacts" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${reportSendConfigurationInstance.contacts.sort{it.name}}" var="r">
						<li><g:link controller="contact" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>	
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.subject.label" default="Subject" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reportSendConfigurationInstance, field: "subject")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.body.label" default="Body" /></td>
				
				<td valign="top" class="value">${reportSendConfigurationInstance.body}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.report.label" default="Report" /></td>
				
				<td valign="top" class="value"><g:link controller="report" action="show" id="${reportSendConfigurationInstance?.report?.id}">${reportSendConfigurationInstance?.report?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.hour.label" default="Hour" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reportSendConfigurationInstance, field: "hour")}</td>
				
			</tr>
			
						
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.active.label" default="Active?" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${reportSendConfigurationInstance?.active}" /></td>
				
			</tr>


			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.sendReport.label" default="Send Report?" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${reportSendConfigurationInstance?.sendReport}" /></td>
				
			</tr>


			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.sendAlerts.label" default="Send Alerts?" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${reportSendConfigurationInstance?.sendAlerts}" /></td>
				
			</tr>


		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reportSendConfigurationInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reportSendConfiguration.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${reportSendConfigurationInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
