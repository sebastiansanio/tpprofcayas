
<%@ page import="product.Product" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-product" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.descriptionSP.label" default="Description SP" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "descriptionSP")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.descriptionEN.label" default="Description EN" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "descriptionEN")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.color.label" default="Color" /></td>
				
				<td valign="top" class="value"><g:link controller="color" action="show" id="${productInstance?.color?.id}">${productInstance?.color?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.unit.label" default="Unit" /></td>
				
				<td valign="top" class="value"><g:link controller="itemUnit" action="show" id="${productInstance?.unit?.id}">${productInstance?.unit?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.currency.label" default="Currency" /></td>
				
				<td valign="top" class="value"><g:link controller="currency" action="show" id="${productInstance?.currency?.id}">${productInstance?.currency?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.family.label" default="Family" /></td>
				
				<td valign="top" class="value"><g:link controller="family" action="show" id="${productInstance?.family?.id}">${productInstance?.family?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.subFamily.label" default="Sub Family" /></td>
				
				<td valign="top" class="value"><g:link controller="subFamily" action="show" id="${productInstance?.subFamily?.id}">${productInstance?.subFamily?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.typeOfPresentation.label" default="Type Of Presentation" /></td>
				
				<td valign="top" class="value"><g:link controller="typeOfPresentation" action="show" id="${productInstance?.typeOfPresentation?.id}">${productInstance?.typeOfPresentation?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.supplier.label" default="Supplier" /></td>
				
				<td valign="top" class="value"><g:link controller="supplier" action="show" id="${productInstance?.supplier?.id}">${productInstance?.supplier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.shipper.label" default="Shipper" /></td>
				
				<td valign="top" class="value"><g:link controller="shipper" action="show" id="${productInstance?.shipper?.id}">${productInstance?.shipper?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.tax.label" default="Tax" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "tax")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.priceCondition.label" default="Price Condition" /></td>
				
				<td valign="top" class="value"><g:link controller="priceCondition" action="show" id="${productInstance?.priceCondition?.id}">${productInstance?.priceCondition?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pricePerUnit.label" default="Price Per Unit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "pricePerUnit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.port.label" default="Port" /></td>
				
				<td valign="top" class="value"><g:link controller="port" action="show" id="${productInstance?.port?.id}">${productInstance?.port?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.consolidationArea.label" default="Consolidation Area" /></td>
				
				<td valign="top" class="value"><g:link controller="port" action="show" id="${productInstance?.consolidationArea?.id}">${productInstance?.consolidationArea?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.country.label" default="Country" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${productInstance?.country?.id}">${productInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.criterionValue.label" default="Criterion Value" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "criterionValue")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.valuePerKilo.label" default="Value Per Kilo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "valuePerKilo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.quantityPerCarton.label" default="Quantity Per Carton" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "quantityPerCarton")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.innerBoxQuantity.label" default="Inner Box Quantity" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "innerBoxQuantity")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.articlesQuantityPerInnerBox.label" default="Articles Quantity Per Inner Box" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "articlesQuantityPerInnerBox")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.netWeightPerBox.label" default="Net Weight Per Box" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "netWeightPerBox")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.grossWeightPerBox.label" default="Gross Weight Per Box" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "grossWeightPerBox")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.outerBoxLength.label" default="Outer Box Length" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "outerBoxLength")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.outerBoxWidth.label" default="Outer Box Width" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "outerBoxWidth")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.outerBoxHeight.label" default="Outer Box Height" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "outerBoxHeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.innerBoxLength.label" default="Inner Box Length" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "innerBoxLength")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.innerBoxWidth.label" default="Inner Box Width" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "innerBoxWidth")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.innerBoxHeight.label" default="Inner Box Height" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "innerBoxHeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.boxesPerPallets.label" default="Boxes Per Pallets" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "boxesPerPallets")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.piecesPerPallet.label" default="Pieces Per Pallet" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "piecesPerPallet")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.atribute.label" default="Atribute" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "atribute")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.codePerCustomer.label" default="Code Per Customer" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.codePerCustomer}" var="c">
						<li><g:link controller="codePerCustomer" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.customerCode.label" default="Customer Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "customerCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.hsCode.label" default="Hs Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "hsCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.innerDimensionUnit.label" default="Inner Dimension Unit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "innerDimensionUnit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.loadsUnits.label" default="Loads Units" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.loadsUnits}" var="l">
						<li><g:link controller="loadUnit" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.outerDimensionUnit.label" default="Outer Dimension Unit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "outerDimensionUnit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.previousPrices.label" default="Previous Prices" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.previousPrices}" var="p">
						<li><g:link controller="historicalPrice" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pricePerCustomer.label" default="Price Per Customer" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productInstance.pricePerCustomer}" var="p">
						<li><g:link controller="pricePerCustomer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.supplierCode.label" default="Supplier Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "supplierCode")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
