
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
				<td valign="top" class="name"><g:message code="product.codeCayas.label" default="Code CAYAS" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "id")}</td>
				
			</tr>
					
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
				<td valign="top" class="name"><g:message code="product.supplierCode.label" default="Supplier Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "supplierCode")}</td>
				
			</tr>
						
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.customerCode.label" default="Customer Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "customerCode")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name" colspan="2" >
								
				<g:message code="product.codePerCustomer.label" default="Code Per Customer" />
				
					<table class="table">
						<thead>
							<th> <g:message code="customer.label" default="Customer"/> </th>
							<th> <g:message code="product.customerCode.label" default="Code"/> </th>
						</thead>
						<tbody>
							<g:each in="${productInstance.codePerCustomer}" var="c">
								<tr>
									<td> ${c.customer} </td>
									<td> ${c.code} </td>
								</tr>
							</g:each>
							
						</tbody>
					</table>
				</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.unit.label" default="Unit" /></td>
				
				<td valign="top" class="value"><g:link controller="itemUnit" action="show" id="${productInstance?.unit?.id}">${productInstance?.unit?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="currency.label" default="Currency" /></td>
				
				<td valign="top" class="value"><g:link controller="currency" action="show" id="${productInstance?.currency?.id}">${productInstance?.currency?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceCondition.label" default="Price Condition" /></td>
				
				<td valign="top" class="value"><g:link controller="priceCondition" action="show" id="${productInstance?.priceCondition?.id}">${productInstance?.priceCondition?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.previousPrices.label" default="Previous Price" /></td>
				
				<td valign="top" class="value"> 
					<ul>
						<li> <g:link controller="priceCondition" action="show" id="${productInstance?.priceCondition?.id}">${productInstance?.priceCondition?.encodeAsHTML()}</g:link> </li>
						<li> fallttaaa </li>
					</ul> 
				</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pricePerUnit.label" default="Price Per Unit" /></td>
				
				<td valign="top" class="value">${productInstance.pricePerUnit}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name" colspan="2" >
				
					<g:message code="product.pricePerCustomer.label" default="Price Per Customer" />
					
					<table class="table">
						<thead>
							<th> <g:message code="customer.label" default="Customer"/> </th>
							<th> <g:message code="product.customerCode.label" default="Code"/> </th>
						</thead>
						<tbody>
								<g:each in="${productInstance.pricePerCustomer}" var="p">								
								<tr>
									<td> ${p.customer} </td>
									<td> ${p.price} </td>
								</tr>
							</g:each>
							
						</tbody>
					</table>
				</td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.datePreviousPrice.label" default="Date Of The Last Price" /></td>
				
				<td valign="top" class="value"> ALGO </td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="port.label" default="Port" /></td>
				
				<td valign="top" class="value"><g:link controller="port" action="show" id="${productInstance?.port?.id}">${productInstance?.port?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.consolidationArea.label" default="Consolidation Area" /></td>
				
				<td valign="top" class="value"><g:link controller="port" action="show" id="${productInstance?.consolidationArea?.id}">${productInstance?.consolidationArea?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="family.label" default="Family" /></td>
				
				<td valign="top" class="value"><g:link controller="family" action="show" id="${productInstance?.family?.id}">${productInstance?.family?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subFamily.label" default="Sub Family" /></td>
				
				<td valign="top" class="value"><g:link controller="subFamily" action="show" id="${productInstance?.subFamily?.id}">${productInstance?.subFamily?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.attribute.label" default="Attribute" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "attribute")}</td>
				
			</tr>
						
			<tr class="prop">
				<td valign="top" class="name"><g:message code="typeOfPresentation.label" default="Type Of Presentation" /></td>
				
				<td valign="top" class="value"><g:link controller="typeOfPresentation" action="show" id="${productInstance?.typeOfPresentation?.id}">${productInstance?.typeOfPresentation?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="supplier.label" default="Supplier" /></td>
				
				<td valign="top" class="value"><g:link controller="supplier" action="show" id="${productInstance?.supplier?.id}">${productInstance?.supplier?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="shipper.label" default="Shipper" /></td>
				
				<td valign="top" class="value"><g:link controller="shipper" action="show" id="${productInstance?.shipper?.id}">${productInstance?.shipper?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.country.label" default="Country Of Origin" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${productInstance?.country?.id}">${productInstance?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.countryProvenance.label" default="Country Of Provenance" /></td>
				
				<td valign="top" class="value"><g:link controller="country" action="show" id="${productInstance?.supplier?.country?.id}">${productInstance?.supplier?.country?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.criterionValue.label" default="Criterion Value" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "criterionValue")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.valuePerKilo.label" default="Value Per Kilo" /></td>
				
				<td valign="top" class="value">${productInstance?.getValuePerKilo()}</td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.hsCode.label" default="Hs Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "hsCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.tax.label" default="Tax" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "tax")}</td>
				
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
				
				<td valign="top" class="value">${productInstance.netWeightPerBox}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.grossWeightPerBox.label" default="Gross Weight Per Box" /></td>
				
				<td valign="top" class="value">${productInstance.grossWeightPerBox}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.outerBoxDimensions.label" default="Outer Box Dimensions" /></td>
				
				<td valign="top" class="value">${productInstance.outerBoxLength} x ${productInstance.outerBoxWidth} x ${productInstance.outerBoxHeight}</td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.volumenPerBox.label" default="Volumen Per Box (m3)" /></td>
				
				<td valign="top" class="value">${productInstance.getOuterBoxVolume()}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.innerBoxDimensions.label" default="Inner Box Dimensions" /></td>
				
				<td valign="top" class="value">${productInstance.innerBoxLength} x ${productInstance.innerBoxWidth} x ${productInstance.innerBoxHeight}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.unitsPerContainerWeight.label" default="Units Per Container(weight)" /></td>
				
				<td valign="top" class="value">${productInstance?.getUnitsPerContainerWeight()}</td>
				
			</tr>			
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.unitsPerContainerVolume.label" default="Units Per Container(volume)" /></td>
				
				<td valign="top" class="value">${productInstance?.getUnitsPerContainerVolume()}</td>
				
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
				<td valign="top" class="name"><g:message code="product.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productInstance, field: "notes")}</td>
				
			</tr>
											
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.dateCreated}" /></td>
				
			</tr>			
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productInstance?.lastUpdated}" /></td>
				
			</tr>
					
		</tbody>
	</table>
</section>

</body>

</html>
