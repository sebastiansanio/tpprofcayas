
<%@ page import="stakeholder.CustomsBroker" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customsBroker.label', default: 'CustomsBroker')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-customsBroker" class="first">

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
						<td valign="top" class="name"><g:message code="customsBroker.name.label" default="Name" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customsBrokerInstance, field: "name")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.country.label" default="Country" /></td>
						
						<td valign="top" class="value"><g:link controller="country" action="show" id="${customsBrokerInstance?.country?.id}">${customsBrokerInstance?.country?.encodeAsHTML()}</g:link></td>
						
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.province.label" default="Province" /></td>
						
						<td valign="top" class="value">${customsBrokerInstance?.province?.encodeAsHTML()}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.locality.label" default="Locality" /></td>
						
						<td valign="top" class="value">${customsBrokerInstance?.locality?.encodeAsHTML()}</td>
					</tr>
									
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.telephone.label" default="Telephone" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customsBrokerInstance, field: "telephone")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.email.label" default="Email" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customsBrokerInstance, field: "email")}</td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></td>
						
						<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${customsBrokerInstance?.defaultLocale?.id}">${customsBrokerInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.defaultReport.label" default="Default Report" /></td>
						
						<td valign="top" class="value"><g:link controller="report" action="show" id="${customsBrokerInstance?.defaultReport?.id}">${customsBrokerInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
						
					</tr>
				
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.notes.label" default="Notes" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customsBrokerInstance, field: "notes")}</td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.dateCreated.label" default="Date Created" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${customsBrokerInstance?.dateCreated}" /></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customsBroker.lastUpdated.label" default="Last Updated" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${customsBrokerInstance?.lastUpdated}" /></td>
						
					</tr>
							
				</tbody>
			</table>		
		</div>
		
		<div class="tab-pane" id="tab2">
			<g:render template="/_stakeholder/wishes" model="['wishes':customsBrokerInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab3">
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':customsBrokerInstance]"/>	

		</div>
		
		<div class="tab-pane" id="tab4">
			<g:render template="/_stakeholder/wishes" model="['wishes':customsBrokerInstance.wishes.findAll{it.billDate!=null && it.finishDate==null}.sort{it.opNumber}]"/>		
		</div>
		
		<div class="tab-pane" id="tab5">
			<g:render template="/_stakeholder/wishes" model="['wishes':customsBrokerInstance.wishes.findAll{it.finishDate!=null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab6">
			<g:render template="/_stakeholder/exportWishes" model="['stakeholderInstance':customsBrokerInstance]"/>			
		</div>
	</div>
</div>	


</section>

</body>

</html>
