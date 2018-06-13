
<%@ page import="prices.CustomerPriceCriteria" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-customerPriceCriteria" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.comission.label" default="Comission" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customerPriceCriteriaInstance, field: "comission")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.customerGroup.label" default="Customer Group" /></td>
				
				<td valign="top" class="value"><g:link controller="customerGroup" action="show" id="${customerPriceCriteriaInstance?.customerGroup?.id}">${customerPriceCriteriaInstance?.customerGroup?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${customerPriceCriteriaInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.extra1.label" default="Extra1" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customerPriceCriteriaInstance, field: "extra1")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.extra2.label" default="Extra2" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customerPriceCriteriaInstance, field: "extra2")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.family.label" default="Family" /></td>
				
				<td valign="top" class="value"><g:link controller="family" action="show" id="${customerPriceCriteriaInstance?.family?.id}">${customerPriceCriteriaInstance?.family?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerPriceCriteria.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${customerPriceCriteriaInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
