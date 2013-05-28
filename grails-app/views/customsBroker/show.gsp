
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

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customsBroker.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customsBrokerInstance, field: "name")}</td>
				
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
				<td valign="top" class="name"><g:message code="customsBroker.defaultReport.label" default="Default Report" /></td>
				
				<td valign="top" class="value"><g:link controller="report" action="show" id="${customsBrokerInstance?.defaultReport?.id}">${customsBrokerInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customsBroker.defaultLocale.label" default="Default Locale" /></td>
				
				<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${customsBrokerInstance?.defaultLocale?.id}">${customsBrokerInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
				
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
				<td valign="top" class="name"><g:message code="stakeholder.pendingWishes.label" default="Pending Orders" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${customsBrokerInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w.opNumber + ' - '+w.supplier + ' > '+ w.customer +(w.supplierOrder!=null?' ('+w.supplierOrder+')':'')}</g:link></li>
					</g:each>
					</ul>

					<export:formats controller="wish" action="exportByStakeholder" params='[id: customsBrokerInstance.id]' formats="['csv','excel','ods','pdf']" />
					
					
				</td>
			</tr>
			
			<tr><td></td>
				<td>
					<g:link role="button" class="btn btn-primary" action='listBilledByStakeholder' controller='wish' id='${customsBrokerInstance.id}'>${message(code:'stakeholder.billedWishes.label')}</g:link>					
				</td>
			
			</tr>

			<g:render template="/_stakeholder/show" model="['stakeholderInstance':customsBrokerInstance]"/>
		
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
</section>

</body>

</html>
