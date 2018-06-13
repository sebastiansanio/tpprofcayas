
<%@ page import="prices.SupplierPriceCriteria" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-supplierPriceCriteria" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.product.label" default="Product" /></td>
				
				<td valign="top" class="value"><g:link controller="product" action="show" id="${supplierPriceCriteriaInstance?.product?.id}">${supplierPriceCriteriaInstance?.product?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.variable.label" default="Variable" /></td>
				
				<td valign="top" class="value"><g:link controller="priceVariable" action="show" id="${supplierPriceCriteriaInstance?.variable?.id}">${supplierPriceCriteriaInstance?.variable?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.priceVariableFrom.label" default="Price Variable From" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierPriceCriteriaInstance, field: "priceVariableFrom")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.priceVariableTo.label" default="Price Variable To" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierPriceCriteriaInstance, field: "priceVariableTo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.basePrice1.label" default="Base Price1" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierPriceCriteriaInstance, field: "basePrice1")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.basePrice2.label" default="Base Price2" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: supplierPriceCriteriaInstance, field: "basePrice2")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${supplierPriceCriteriaInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplierPriceCriteria.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${supplierPriceCriteriaInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
