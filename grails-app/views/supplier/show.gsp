
<%@ page import="stakeholder.Supplier" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-supplier" class="first">

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
						<td valign="top" class="name"><g:message code="supplier.name.label" default="Name" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "name")}</td>
						
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.country.label" default="Country" /></td>
						
						<td valign="top" class="value"><g:link controller="country" action="show" id="${supplierInstance?.country?.id}">${supplierInstance?.country?.encodeAsHTML()}</g:link></td>
						
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.province.label" default="Province" /></td>
						
						<td valign="top" class="value">${supplierInstance?.province?.encodeAsHTML()}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.locality.label" default="Locality" /></td>
						
						<td valign="top" class="value">${supplierInstance?.locality?.encodeAsHTML()}</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.address.label" default="Address" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "address")}</td>
						
					</tr>
														
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.telephone.label" default="Telephone" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "telephone")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.email.label" default="Email" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "email")}</td>
						
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></td>
						
						<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${supplierInstance?.defaultLocale?.id}">${supplierInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
						
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.defaultReport.label" default="Default Report" /></td>
						
						<td valign="top" class="value"><g:link controller="report" action="show" id="${supplierInstance?.defaultReport?.id}">${supplierInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.taxRegistryNumber.label" default="Tax Registry Number" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "taxRegistryNumber")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.accountName.label" default="Account name" /></td>
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "accountName")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.accountNumber.label" default="Account number" /></td>
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "accountNumber")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.bankName.label" default="Bank name" /></td>
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "bankName")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.bankAddress.label" default="Bank address" /></td>
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "bankAddress")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.swiftCode.label" default="Swift code" /></td>
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "swiftCode")}</td>
					</tr>
		
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.owner.label" default="Owner" /></td>
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "owner")}</td>
					</tr>

					<g:if test="${supplierInstance.extrasDefault}">
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.extrasDefault.label" default="Aluminum Extras" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "email")}</td>
						
					</tr>					
					</g:if>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="stakeholder.notes.label" default="Notes" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "notes")}</td>
						
					</tr>
						
					<g:if test="{supplierInstance.aluminumSupplier}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="supplier.extrasDefault.label" default="Aluminum Extra" /></td>
							
							<td valign="top" class="value">
								<ul>
								<g:each in="${supplierInstance.extrasDefault}" var="extra">
									<li> ${extra} </li>
								</g:each>
								</ul>
							</td>							
						</tr>
					</g:if>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.dateCreated.label" default="Date Created" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${supplierInstance?.dateCreated}" /></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="supplier.lastUpdated.label" default="Last Updated" /></td>
						
						<td valign="top" class="value"><g:formatDate date="${supplierInstance?.lastUpdated}" /></td>
						
					</tr>
							
				</tbody>
			</table>
		</div>

		<div class="tab-pane" id="tab2">
			<g:render template="/_stakeholder/wishes" model="['wishes':supplierInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab3">
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':supplierInstance]"/>	

		</div>
		
		<div class="tab-pane" id="tab4">
			<g:render template="/_stakeholder/wishes" model="['wishes':supplierInstance.wishes.findAll{it.billDate!=null && it.finishDate==null}.sort{it.opNumber}]"/>		
		</div>
		
		<div class="tab-pane" id="tab5">
			<g:render template="/_stakeholder/wishes" model="['wishes':supplierInstance.wishes.findAll{it.finishDate!=null}.sort{it.opNumber}]"/>
		</div>
		
		<div class="tab-pane" id="tab6">
			<g:render template="/_stakeholder/exportWishes" model="['stakeholderInstance':supplierInstance]"/>			
		</div>
		
	</div>
	</div>
</section>

</body>

</html>
