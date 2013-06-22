
<%@ page import="stakeholder.OtherStakeholder" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'otherStakeholder.label', default: 'OtherStakeholder')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-otherStakeholder" class="first">

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
				<td valign="top" class="name"><g:message code="stakeholder.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: otherStakeholderInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: otherStakeholderInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: otherStakeholderInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.defaultReport.label" default="Default Report" /></td>
				
				<td valign="top" class="value"><g:link controller="report" action="show" id="${otherStakeholderInstance?.defaultReport?.id}">${otherStakeholderInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></td>
				
				<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${otherStakeholderInstance?.defaultLocale?.id}">${otherStakeholderInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.province.label" default="Province" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: otherStakeholderInstance, field: "province")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.locality.label" default="Locality" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: otherStakeholderInstance, field: "locality")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: otherStakeholderInstance, field: "notes")}</td>
				
			</tr>

		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${otherStakeholderInstance?.country?.id}">${otherStakeholderInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${otherStakeholderInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${otherStakeholderInstance?.lastUpdated}" /></td>
				
			</tr>
								
					</tbody>
				</table>
			</div>
		<div class="tab-pane" id="tab2">
			<g:render template="/_stakeholder/wishes" model="['wishes':otherStakeholderInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab3">
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':otherStakeholderInstance]"/>	

		</div>
		
		<div class="tab-pane" id="tab4">
			<g:render template="/_stakeholder/wishes" model="['wishes':otherStakeholderInstance.wishes.findAll{it.billDate!=null && it.finishDate==null}.sort{it.opNumber}]"/>		
		</div>
		
		<div class="tab-pane" id="tab5">
			<g:render template="/_stakeholder/wishes" model="['wishes':otherStakeholderInstance.wishes.findAll{it.finishDate!=null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab6">
			<g:render template="/_stakeholder/exportWishes" model="['stakeholderInstance':otherStakeholderInstance]"/>			
		</div>
		</div>
	</div>		

</section>

</body>

</html>