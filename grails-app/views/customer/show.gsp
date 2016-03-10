
<%@ page import="stakeholder.Customer" %>

<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-customer" class="first">

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab1" data-toggle="tab"> <g:message code="stakeholder.generalData.label" default="General data" /> </a></li>		
		<li class=""><a href="#tab3" data-toggle="tab"> <g:message code="stakeholder.contacts.label" default="Contacts" /> </a></li>		
		<li class=""><a href="#tab2" data-toggle="tab"> <g:message code="stakeholder.pendingWishes.label" default="Pending Orders" /> </a> </li>
		<li class=""><a href="#tab4" data-toggle="tab"> <g:message code="stakeholder.billedWishes.label" default="Billed Orders" /> </a></li>
		<li class=""><a href="#tab5" data-toggle="tab"> <g:message code="stakeholder.finishedWishes.label" default="Finished Orders" /> </a></li>
		<li class=""><a href="#tab6" data-toggle="tab"> <g:message code="stakeholder.exportWishes.label" default="Export Orders" /> </a></li>
		<li class=""><a href="#priceList" data-toggle="tab"> <g:message code="supplier.priceList.label" default="Price List" /> </a></li>		
	</ul>
	<div class="tab-content" >
		<div class="tab-pane active" id="tab1">
			<table class="table">
				<tbody>
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.name.label" default="Name" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "name")}</td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.prefix.label" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "prefix")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.country.label" default="Country" /></td>
						
						<td valign="top" class="value"><g:link controller="country" action="show" id="${customerInstance?.country?.id}">${customerInstance?.country?.encodeAsHTML()}</g:link></td>
						
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.province.label" default="Province" /></td>
						
						<td valign="top" class="value">${customerInstance?.province?.encodeAsHTML()}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.locality.label" default="Locality" /></td>
						
						<td valign="top" class="value">${customerInstance?.locality?.encodeAsHTML()}</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.address.label" default="Address" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "address")}</td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.telephone.label" default="Telephone" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "telephone")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.email.label" default="Email" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "email")}</td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.cuit.label" default="Cuit" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "cuit")}</td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></td>
						<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${customerInstance?.defaultLocale?.id}">${customerInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
					</tr>				
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.defaultReport.label" default="Default Report" /></td>
						<td valign="top" class="value"><g:link controller="report" action="show" id="${customerInstance?.defaultReport?.id}">${customerInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.defaultMargin.label" /></td>
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "defaultMargin")}</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.notes.label" default="Notes" /></td>
						<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "notes")}</td>
					</tr>
												
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.dateCreated.label" default="Date Created" /></td>
						<td valign="top" class="value"><g:formatDate date="${customerInstance?.dateCreated}" /></td>
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="customer.lastUpdated.label" default="Last Updated" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${customerInstance?.lastUpdated}" /></td>
						
					</tr>
							
				</tbody>
			</table>
		</div>
		
		<div class="tab-pane" id="tab2">
			<g:render template="/_stakeholder/wishes" model="['wishes':customerInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab3">
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':customerInstance]"/>	

		</div>
		
		<div class="tab-pane" id="tab4">
			<g:render template="/_stakeholder/wishes" model="['wishes':customerInstance.wishes.findAll{it.billDate!=null && it.finishDate==null}.sort{it.opNumber}]"/>		
		</div>
		
		<div class="tab-pane" id="tab5">
			<g:render template="/_stakeholder/wishes" model="['wishes':customerInstance.wishes.findAll{it.finishDate!=null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab6">
			<g:render template="/_stakeholder/exportWishes" model="['stakeholderInstance':customerInstance]"/>			
		</div>

		<div class="tab-pane" id="priceList">
			<g:render template="priceListShow" model="['priceLists': customerInstance?.priceLists]"/>
		</div>
				
	</div>
</div>

</section>

</body>

</html>
