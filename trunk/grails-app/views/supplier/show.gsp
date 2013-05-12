
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

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "name")}</td>
				
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
				<td valign="top" class="name"><g:message code="supplier.defaultReport.label" default="Default Report" /></td>
				
				<td valign="top" class="value"><g:link controller="report" action="show" id="${supplierInstance?.defaultReport?.id}">${supplierInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.defaultLocale.label" default="Default Locale" /></td>
				
				<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${supplierInstance?.defaultLocale?.id}">${supplierInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.address.label" default="Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "address")}</td>
				
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
				<td valign="top" class="name"><g:message code="supplier.taxRegistryNumber.label" default="Tax Registry Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierInstance, field: "taxRegistryNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.pendingWishes.label" default="Pending Orders" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${supplierInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w.opNumber + ' - '+w.supplier + ' > '+ w.customer +(w.supplierOrder!=null?' ('+w.supplierOrder+')':'')}</g:link></li>
					</g:each>
					</ul>

					<export:formats controller="wish" action="exportByStakeholder" params='[id: supplierInstance.id]' formats="['csv','excel','ods','pdf']" />
					
					
				</td>
			</tr>
			
			<tr><td></td>
				<td class="btn">
					<g:link action='listBilledByStakeholder' controller='wish' id='${supplierInstance.id}'>${message(code:'stakeholder.billedWishes.label')}</g:link>					
				</td>
			
			</tr>
		
			<g:render template="/_stakeholder/show" model="['stakeholderInstance':supplierInstance]"/>

		
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
</section>

</body>

</html>
