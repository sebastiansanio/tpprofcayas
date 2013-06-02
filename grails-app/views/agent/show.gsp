
<%@ page import="stakeholder.Agent" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-agent" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.defaultReport.label" default="Default Report" /></td>
				
				<td valign="top" class="value"><g:link controller="report" action="show" id="${agentInstance?.defaultReport?.id}">${agentInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.defaultLocale.label" default="Default Locale" /></td>
				
				<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${agentInstance?.defaultLocale?.id}">${agentInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${agentInstance?.country?.id}">${agentInstance?.country?.encodeAsHTML()}</g:link></td>
			</tr>


			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.province.label" default="Province" /></td>
				
				<td valign="top" class="value">${agentInstance?.province?.encodeAsHTML()}</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.locality.label" default="Locality" /></td>
				
				<td valign="top" class="value">${agentInstance?.locality?.encodeAsHTML()}</td>
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.pendingWishes.label" default="Pending Orders" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${agentInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w.opNumber + ' - '+w.supplier + ' > '+ w.customer +(w.supplierOrder!=null?' ('+w.supplierOrder+')':'')}</g:link></li>
					</g:each>
					</ul>

					<export:formats controller="wish" action="exportByStakeholder" params='[id: agentInstance.id]' formats="['csv','excel','ods','pdf']" />
					
					
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<g:link role="button" class="btn btn-primary" action='listBilledByStakeholder' controller='wish' id='${agentInstance.id}'>${message(code:'stakeholder.billedWishes.label')}</g:link>					
				
					<g:link role="button" class="btn btn-primary" action='listFinishedByStakeholder' controller='wish' id='${agentInstance.id}'>${message(code:'stakeholder.finishedWishes.label')}</g:link>	
				</td>
			</tr>
			
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':agentInstance]"/>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${agentInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="agent.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${agentInstance?.lastUpdated}" /></td>
				
			</tr>
					
		</tbody>
	</table>
</section>

</body>

</html>
