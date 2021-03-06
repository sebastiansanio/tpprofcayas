<%@ page import="product.Product" %>
<%@ page import="stakeholder.Customer" %>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'descriptionSP', 'error')} required">
				<label for="descriptionSP" class="control-label"><g:message code="product.descriptionSP.label" default="Description SP" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="descriptionSP" required="" value="${productInstance?.descriptionSP}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'descriptionSP', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'descriptionEN', 'error')} required">
				<label for="descriptionEN" class="control-label"><g:message code="product.descriptionEN.label" default="Description EN" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="descriptionEN" required="" value="${productInstance?.descriptionEN}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'descriptionEN', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'hsCode', 'error')} required">
				<label for="hsCode" class="control-label"><g:message code="product.hsCode.label" default="Hs Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField pattern="^[0-9]{4}\\.[0-9]{2}\\..*" name="hsCode" value="${productInstance?.hsCode}" required=""/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'hsCode', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'family', 'error')} required">
				<label for="family" class="control-label"><g:message code="family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select required="" id="family" noSelection="['null': '']" name="family.id" from="${product.Family.list()}" optionKey="id" required="" value="${productInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'family', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'subFamily', 'error')} ">
				<label for="subFamily" class="control-label"><g:message code="subFamily.label" default="Sub Family" /></label>
				<div class="controls">
					<g:select id="subFamily" name="subFamily.id" from="${productInstance?.family?.subFamily}" optionKey="id" required="" value="${productInstance?.subFamily?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'subFamily', 'error')}</span>
				</div>
			</div>

			<span id="codePerCustomer"></span> 

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'color', 'error')} ">
				<label for="color" class="control-label"><g:message code="color.label" default="Color" /></label>
				<div class="controls">
					<g:select id="color" name="color.id" from="${product.Color.list()}" optionKey="id" value="${productInstance?.color?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'color', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'supplierCode', 'error')} ">
				<label for="supplierCode" class="control-label"><g:message code="product.supplierCode.label" default="Code" /></label>
				<div class="controls">
					<g:textField name="supplierCode" value="${productInstance?.supplierCode}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'supplierCode', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'customerCode', 'error')} ">
				<label for="customerCode" class="control-label"><g:message code="product.customerCode.label" default="Customer Code" /></label>
				<div class="controls">
					<g:textField name="customerCode" value="${productInstance?.customerCode}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'customerCode', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'codePerCustomer', 'error')} ">
				<label for="codePerCustomer" class="control-label"><g:message code="product.codePerCustomer.label" default="Code Per Customer" /></label>
				<div class="controls">
					
					<g:render template="/_abstractProduct/codePerCustomerForm" model="['productInstance':productInstance]"/>

					<span class="help-inline">${hasErrors(bean: productInstance, field: 'codePerCustomer', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="product.status.label" default="Status" /></label>
				<div class="controls">
					<g:select name="status" from="${productInstance.constraints.status.inList}" value="${productInstance?.status}" valueMessagePrefix="product.status" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'status', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'unit', 'error')} ">
				<label for="unit" class="control-label"><g:message code="product.unit.label" default="Unit Of Sale" /></label>
				<div class="controls">
					<g:select id="unit" name="unit.id" from="${product.ItemUnit.list()}" optionKey="id" value="${productInstance?.unit?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'unit', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'currency', 'error')} ">
				<label for="currency" class="control-label"><g:message code="currency.label" default="Currency" /></label>
				<div class="controls">
					<g:select id="currency" name="currency.id" from="${modal.Currency.list()}" optionKey="id" value="${productInstance?.currency?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'currency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'priceCondition', 'error')} ">
				<label for="priceCondition" class="control-label"><g:message code="priceCondition.label" default="Price Condition" /></label>
				<div class="controls">
					<g:select id="priceCondition" name="priceCondition.id" from="${modal.PriceCondition.list()}" optionKey="id" value="${productInstance?.priceCondition?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'priceCondition', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'pricePerUnit', 'error')} ">
				<label for="pricePerUnit" class="control-label"><g:message code="product.pricePerUnit.label" default="Price Per Unit" /></label>
				<div class="controls">
					<g:field type="number" name="pricePerUnit" step="0.0001" min="0.0000" value="${productInstance.pricePerUnit}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'pricePerUnit', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'port', 'error')} ">
				<label for="port" class="control-label"><g:message code="port.label" default="Port" /></label>
				<div class="controls">
					<g:select id="port" name="port.id" from="${modal.Port.list()}" optionKey="id" value="${productInstance?.port?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'port', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'consolidationArea', 'error')} ">
				<label for="consolidationArea" class="control-label"><g:message code="product.consolidationArea.label" default="Consolidation Area" /></label>
				<div class="controls">
					<g:select id="consolidationArea" name="consolidationArea.id" from="${modal.Port.list()}" optionKey="id" value="${productInstance?.consolidationArea?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'consolidationArea', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'attribute', 'error')} ">
				<label for="attribute" class="control-label"><g:message code="product.attribute.label" default="Attribute" /></label>
				<div class="controls">
					<g:textField name="attribute" value="${productInstance?.attribute}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'attribute', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'typeOfPresentation', 'error')} ">
				<label for="typeOfPresentation" class="control-label"><g:message code="typeOfPresentation.label" default="Type Of Presentation" /></label>
				<div class="controls">
					<g:select id="typeOfPresentation" name="typeOfPresentation.id" from="${product.TypeOfPresentation.list()}" optionKey="id" value="${productInstance?.typeOfPresentation?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'typeOfPresentation', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'supplier', 'error')} ">
				<label for="supplier" class="control-label"><g:message code="supplier.label" default="Supplier" /></label>
				<div class="controls">
					<g:select id="supplier" name="supplier.id" from="${stakeholder.Supplier.list()}" optionKey="id" value="${productInstance?.supplier?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'supplier', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'shipper', 'error')} ">
				<label for="shipper" class="control-label"><g:message code="shipper.label" default="Shipper" /></label>
				<div class="controls">
					<g:select id="shipper" name="shipper.id" from="${stakeholder.Shipper.list()}" optionKey="id" value="${productInstance?.shipper?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'shipper', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'country', 'error')} ">
				<label for="country" class="control-label"><g:message code="product.country.label" default="Country" /></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" value="${productInstance?.country?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'criterionValue', 'error')} ">
				<label for="criterionValue" class="control-label"><g:message code="product.criterionValue.label" default="Criterion Value" /></label>
				<div class="controls">
					<g:field type="number" name="criterionValue" step="0.0001" min="0.0000" value="${productInstance.criterionValue}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'criterionValue', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'tax', 'error')} ">
				<label for="tax" class="control-label"><g:message code="product.tax.label" default="Tax" /></label>
				<div class="controls">
					<g:field type="number" name="tax" step="0.01" min="0.00" max="100.00" value="${productInstance.tax}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'tax', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'quantityPerCarton', 'error')} ">
				<label for="quantityPerCarton" class="control-label"><g:message code="product.quantityPerCarton.label" default="Quantity Per Carton" /></label>
				<div class="controls">
					<g:field type="number" name="quantityPerCarton" min="0" value="${productInstance.quantityPerCarton}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'quantityPerCarton', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'innerBoxQuantity', 'error')} ">
				<label for="innerBoxQuantity" class="control-label"><g:message code="product.innerBoxQuantity.label" default="Inner Box Quantity" /></label>
				<div class="controls">
					<g:field type="number" name="innerBoxQuantity" min="0" value="${productInstance.innerBoxQuantity}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'innerBoxQuantity', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'articlesQuantityPerInnerBox', 'error')} ">
				<label for="articlesQuantityPerInnerBox" class="control-label"><g:message code="product.articlesQuantityPerInnerBox.label" default="Articles Quantity Per Inner Box" /></label>
				<div class="controls">
					<g:field type="number" name="articlesQuantityPerInnerBox" min="0" value="${productInstance.articlesQuantityPerInnerBox}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'articlesQuantityPerInnerBox', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'netWeightPerBox', 'error')} ">
				<label for="netWeightPerBox" class="control-label"><g:message code="product.netWeightPerBox.label" default="Net Weight Per Box (kg)" /></label>
				<div class="controls">
					<g:field type="number" name="netWeightPerBox" step="0.0001" min="0.0000" value="${productInstance.netWeightPerBox}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'netWeightPerBox', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'grossWeightPerBox', 'error')} ">
				<label for="grossWeightPerBox" class="control-label"><g:message code="product.grossWeightPerBox.label" default="Gross Weight Per Box (kg)" /></label>
				<div class="controls">
					<g:field type="number" name="grossWeightPerBox" step="0.0001" min="0.0000" value="${productInstance.grossWeightPerBox}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'grossWeightPerBox', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'outerBoxLength', 'error')} ">
				<label for="outerBoxLength" class="control-label"><g:message code="product.outerBoxLength.label" default="Outer Box Length" /></label>
				<div class="controls">
					<g:field type="number" name="outerBoxLength" step="0.0001" min="0.0000" value="${productInstance.outerBoxLength}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'outerBoxLength', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'outerBoxWidth', 'error')} ">
				<label for="outerBoxWidth" class="control-label"><g:message code="product.outerBoxWidth.label" default="Outer Box Width" /></label>
				<div class="controls">
					<g:field type="number" name="outerBoxWidth" step="0.0001" min="0.0000" value="${productInstance.outerBoxWidth}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'outerBoxWidth', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'outerBoxHeight', 'error')} ">
				<label for="outerBoxHeight" class="control-label"><g:message code="product.outerBoxHeight.label" default="Outer Box Height" /></label>
				<div class="controls">
					<g:field type="number" name="outerBoxHeight" step="0.0001" min="0.0000" value="${productInstance.outerBoxHeight}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'outerBoxHeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'innerBoxLength', 'error')} ">
				<label for="innerBoxLength" class="control-label"><g:message code="product.innerBoxLength.label" default="Inner Box Length" /></label>
				<div class="controls">
					<g:field type="number" name="innerBoxLength" step="0.0001" min="0.0000" value="${productInstance.innerBoxLength}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'innerBoxLength', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'innerBoxWidth', 'error')} ">
				<label for="innerBoxWidth" class="control-label"><g:message code="product.innerBoxWidth.label" default="Inner Box Width" /></label>
				<div class="controls">
					<g:field type="number" name="innerBoxWidth" step="0.0001" min="0.0000" value="${productInstance.innerBoxWidth}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'innerBoxWidth', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'innerBoxHeight', 'error')} ">
				<label for="innerBoxHeight" class="control-label"><g:message code="product.innerBoxHeight.label" default="Inner Box Height" /></label>
				<div class="controls">
					<g:field type="number" name="innerBoxHeight" step="0.0001" min="0.0000" value="${productInstance.innerBoxHeight}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'innerBoxHeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'boxesPerPallets', 'error')} ">
				<label for="boxesPerPallets" class="control-label"><g:message code="product.boxesPerPallets.label" default="Boxes Per Pallets" /></label>
				<div class="controls">
					<g:field type="number" name="boxesPerPallets" min="0" value="${productInstance.boxesPerPallets}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'boxesPerPallets', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'piecesPerPallet', 'error')} ">
				<label for="piecesPerPallet" class="control-label"><g:message code="product.piecesPerPallet.label" default="Pieces Per Pallet" /></label>
				<div class="controls">
					<g:field type="number" name="piecesPerPallet" min="0" value="${productInstance.piecesPerPallet}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'piecesPerPallet', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'priceVariable', 'error')} ">
				<label for="unit" class="control-label"><g:message code="product.priceVariable.label" /></label>
				<div class="controls">
					<g:select id="unit" name="priceVariable.id" from="${prices.PriceVariable.list()}" optionKey="id" value="${productInstance?.priceVariable?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'priceVariable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'priceVariablePercentage', 'error')} ">
				<label for="priceVariablePercentage" class="control-label"><g:message code="product.priceVariablePercentage.label"  /></label>
				<div class="controls">
					<g:field type="number" name="priceVariablePercentage" min="0" value="${productInstance.priceVariablePercentage}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'priceVariablePercentage', 'error')}</span>
				</div>
			</div>
						
			<g:render template="/_note/noteForm" model="['notes': productInstance?.notes, 'notesCount': productInstance?.notes?.size(), 'id': productInstance?.id]"/>
						
<script type="text/javascript">

	/* para la familia */
	var dirFamily = "${createLink(action:'subFamily')}/";
		
	/* cargar clientes */
	var customers = new Array();
	<%
		Customer.findAll().each
		{
			def option = '<option value="'+ it.id +'"> ' + it + ' </option>'
			out.println(""" customers.push('${option}'); """)
		}	
	%>

	/* para manejar la carga de códigos por usuarios */
	var rowsCode = ${productInstance?.codePerCustomer?.size()} + 0 ;	

</script>

<script type="text/javascript" src="${resource(dir:'js', file:'productForm.js')}"> </script>	
