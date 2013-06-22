
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

	<div class="tabbable">
		<ul class="nav nav-tabs">
		<li class="active"><a href="#tab1" data-toggle="tab"> <g:message code="stakeholder.generalData.label" default="General data" /> </a></li>
		<li class=""><a href="#tab3" data-toggle="tab"> <g:message code="stakeholder.contacts.label" default="Contacts" /> </a></li>
		<li class=""><a href="#tab2" data-toggle="tab"> <g:message code="stakeholder.pendingWishes.label" default="Pending Orders" /> </a> </li>
		<li class=""><a href="#tab4" data-toggle="tab"> <g:message code="stakeholder.billedWishes.label" default="Billed Orders" /> </a></li>
		<li class=""><a href="#tab5" data-toggle="tab"> <g:message code="stakeholder.finishedWishes.label" default="Finished Orders" /> </a></li>
		<li class=""><a href="#tab6" data-toggle="tab"> <g:message code="stakeholder.exportWishes.label" default="Export Orders" /> </a></li>
		</ul>
		<div class="tab-content" >
			<div class="tab-pane active" id="tab1">
				<table class="table">
					<tbody>
					
						<tr class="prop">
							<td valign="top" class="name"><g:message code="agent.name.label" default="Name" /></td>
							
							<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "name")}</td>
							
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
							<td valign="top" class="name"><g:message code="agent.telephone.label" default="Telephone" /></td>
							
							<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "telephone")}</td>
							
						</tr>
					
						<tr class="prop">
							<td valign="top" class="name"><g:message code="agent.email.label" default="Email" /></td>
							
							<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "email")}</td>
							
						</tr>
						
						<tr class="prop">
							<td valign="top" class="name"><g:message code="agent.defaultLocale.label" default="Default Locale" /></td>
							
							<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${agentInstance?.defaultLocale?.id}">${agentInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
							
						</tr>
					
						<tr class="prop">
							<td valign="top" class="name"><g:message code="agent.defaultReport.label" default="Default Report" /></td>
							
							<td valign="top" class="value"><g:link controller="report" action="show" id="${agentInstance?.defaultReport?.id}">${agentInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
							
						</tr>
					
						
						<tr class="prop">
							<td valign="top" class="name"><g:message code="stakeholder.notes.label" default="Notes" /></td>
							
							<td valign="top" class="value">${fieldValue(bean: agentInstance, field: "notes")}</td>
							
						</tr>
			
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
			</div>
		<div class="tab-pane" id="tab2">
			<g:render template="/_stakeholder/wishes" model="['wishes':agentInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab3">
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':agentInstance]"/>	

		</div>
		
		<div class="tab-pane" id="tab4">
			<g:render template="/_stakeholder/wishes" model="['wishes':agentInstance.wishes.findAll{it.billDate!=null && it.finishDate==null}.sort{it.opNumber}]"/>		
		</div>
		
		<div class="tab-pane" id="tab5">
			<g:render template="/_stakeholder/wishes" model="['wishes':agentInstance.wishes.findAll{it.finishDate!=null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab6">
			<g:render template="/_stakeholder/exportWishes" model="['stakeholderInstance':agentInstance]"/>			
		</div>
		</div>
	</div>		

</section>

</body>

</html>
