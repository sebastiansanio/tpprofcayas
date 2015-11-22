
<%@ page import="stakeholder.CustomerFamilyMargin" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-customerFamilyMargin" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerFamilyMargin.customer.label" default="Customer" /></td>
				<td valign="top" class="value"><g:link controller="customer" action="show" id="${customerFamilyMarginInstance?.customer?.id}">${customerFamilyMarginInstance?.customer?.encodeAsHTML()}</g:link></td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerFamilyMargin.family.label" default="Family" /></td>
				<td valign="top" class="value"><g:link controller="family" action="show" id="${customerFamilyMarginInstance?.family?.id}">${customerFamilyMarginInstance?.family?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerFamilyMargin.margin.label" default="Margin" /></td>
				<td valign="top" class="value">${fieldValue(bean: customerFamilyMarginInstance, field: "margin")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerFamilyMargin.dateCreated.label" default="Date Created" /></td>
				<td valign="top" class="value"><g:formatDate date="${customerFamilyMarginInstance?.dateCreated}" /></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerFamilyMargin.lastUpdated.label" default="Last Updated" /></td>
				<td valign="top" class="value"><g:formatDate date="${customerFamilyMarginInstance?.lastUpdated}" /></td>
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
