
<%@ page import="product.PriceList" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceList.label', default: 'PriceList')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-priceList" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceList.supplier.label" default="Supplier" /></td>
				
				<td valign="top" class="value"><g:link controller="supplier" action="show" id="${priceListInstance?.supplier?.id}">${priceListInstance?.supplier?.encodeAsHTML()}</g:link></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceList.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: priceListInstance, field: "name")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceList.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${priceListInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceList.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${priceListInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
		
	<h4><g:message code="priceList.products.label" default="Products"/></h4>	
	<table class="table table-hover">
		<tbody>
			<g:each in="${priceListInstance.productsPrice.sort{it.toString()}}" var="p">
			<tr class="prop">
				<td valign="top" class="name"> ${p.product.toString()} </td>
				
				<td valign="top" style="text-align: right;" class="value"> ${p.price} </td>
				
				<td valign="top" style="text-align: right;">  <g:link action="showHistorical" params='[productId:"${p.product.id}", listId:"${priceListInstance.id}"]' class="btn btn-small btn-primary"><i class="icon-eye-open"></i></g:link></td>
			</tr>
			</g:each>
		</tbody>
	</table>
		
</section>

</body>

</html>
