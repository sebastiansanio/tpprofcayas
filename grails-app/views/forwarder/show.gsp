
<%@ page import="stakeholder.Forwarder" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'forwarder.label', default: 'Forwarder')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-forwarder" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: forwarderInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: forwarderInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: forwarderInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.defaultReport.label" default="Default Report" /></td>
				
				<td valign="top" class="value"><g:link controller="report" action="show" id="${forwarderInstance?.defaultReport?.id}">${forwarderInstance?.defaultReport?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.defaultLocale.label" default="Default Locale" /></td>
				
				<td valign="top" class="value"><g:link controller="availableLocale" action="show" id="${forwarderInstance?.defaultLocale?.id}">${forwarderInstance?.defaultLocale?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${forwarderInstance?.country?.id}">${forwarderInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.province.label" default="Province" /></td>
				
				<td valign="top" class="value">${forwarderInstance?.province?.encodeAsHTML()}</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.locality.label" default="Locality" /></td>
				
				<td valign="top" class="value">${forwarderInstance?.locality?.encodeAsHTML()}</td>
			</tr>
		
		
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="stakeholder.pendingWishes.label" default="Pending Orders" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${forwarderInstance.wishes.findAll{it.billDate==null && it.finishDate==null}.sort{it.opNumber}}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w.opNumber + ' - '+w.supplier + ' > '+ w.customer +(w.supplierOrder!=null?' ('+w.supplierOrder+')':'')}</g:link></li>
					</g:each>
					</ul>

					<export:formats controller="wish" action="exportByStakeholder" params='[id: forwarderInstance.id]' formats="['csv','excel','ods','pdf']" />
					
					
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<g:link role="button" class="btn btn-primary" action='listBilledByStakeholder' controller='wish' id='${forwarderInstance.id}'>${message(code:'stakeholder.billedWishes.label')}</g:link>					
				
					<g:link role="button" class="btn btn-primary" action='listFinishedByStakeholder' controller='wish' id='${forwarderInstance.id}'>${message(code:'stakeholder.finishedWishes.label')}</g:link>	
				</td>
			</tr>

			<g:render template="/_stakeholder/show" model="['stakeholderInstance':forwarderInstance]"/>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${forwarderInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="forwarder.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${forwarderInstance?.lastUpdated}" /></td>
				
			</tr>
			
		</tbody>
	</table>
</section>

</body>

</html>
