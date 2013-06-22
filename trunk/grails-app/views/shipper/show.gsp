
<%@ page import="stakeholder.Shipper" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shipper.label', default: 'Shipper')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-shipper" class="first">

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
						<td valign="top" class="name"><g:message code="shipper.name.label" default="Name" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "name")}</td>
						
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.country.label" default="Country" /></td>
						
						<td valign="top" class="value"><g:link controller="country" action="show" id="${shipperInstance?.country?.id}">${shipperInstance?.country?.encodeAsHTML()}</g:link></td>
						
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.province.label" default="Province" /></td>
						
						<td valign="top" class="value">${shipperInstance?.province?.encodeAsHTML()}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.locality.label" default="Locality" /></td>
						
						<td valign="top" class="value">${shipperInstance?.locality?.encodeAsHTML()}</td>
					</tr>
									
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.telephone.label" default="Telephone" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "telephone")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.email.label" default="Email" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "email")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.defaultLocale.label" default="Default Locale" /></td>
						
						<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${shipperInstance?.defaultLocale?.id}">${shipperInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.defaultReport.label" default="Default Report" /></td>
						
						<td valign="top" class="value"><g:link controller="report" action="show" id="${shipperInstance?.defaultReport?.id}">${shipperInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.accountName.label" default="Account name" /></td>
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "accountName")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.accountNumber.label" default="Account number" /></td>
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "accountNumber")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.bankName.label" default="Bank name" /></td>
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "bankName")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.bankAddress.label" default="Bank address" /></td>
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "bankAddress")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.swiftCode.label" default="Swift code" /></td>
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "swiftCode")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.owner.label" default="Owner" /></td>
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "owner")}</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.notes.label" default="Notes" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: shipperInstance, field: "notes")}</td>
						
					</tr>		
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.dateCreated.label" default="Date Created" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${shipperInstance?.dateCreated}" /></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="shipper.lastUpdated.label" default="Last Updated" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${shipperInstance?.lastUpdated}" /></td>
						
					</tr>
							
				</tbody>
			</table>
		
		</div>
		<div class="tab-pane" id="tab2">
			<g:render template="/_stakeholder/wishes" model="['wishes':shipperInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab3">
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':shipperInstance]"/>	

		</div>
		
		<div class="tab-pane" id="tab4">
			<g:render template="/_stakeholder/wishes" model="['wishes':shipperInstance.wishes.findAll{it.billDate!=null && it.finishDate==null}.sort{it.opNumber}]"/>		
		</div>
		
		<div class="tab-pane" id="tab5">
			<g:render template="/_stakeholder/wishes" model="['wishes':shipperInstance.wishes.findAll{it.finishDate!=null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab6">
			<g:render template="/_stakeholder/exportWishes" model="['stakeholderInstance':shipperInstance]"/>			
		</div>
	</div>
</div>	


</section>

</body>

</html>
