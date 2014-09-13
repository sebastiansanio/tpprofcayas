<%@ page import="product.Aluminum" %>
<%@ page import="stakeholder.Customer" %>


			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'descriptionSP', 'error')} required">
				<label for="descriptionSP" class="control-label"><g:message code="aluminum.descriptionSP.label" default="Description SP" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="descriptionSP" required="" value="${aluminumInstance?.descriptionSP}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'descriptionSP', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'descriptionEN', 'error')} required">
				<label for="descriptionEN" class="control-label"><g:message code="aluminum.descriptionEN.label" default="Description EN" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="descriptionEN" required="" value="${aluminumInstance?.descriptionEN}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'descriptionEN', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'cayasCode', 'error')} required">
				<label for="cayasCode" class="control-label"><g:message code="aluminum.cayasCode.label" default="Cayas Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="cayasCode" required="" value="${aluminumInstance?.cayasCode}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'cayasCode', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'supplier', 'error')} ">
				<label for="supplier" class="control-label"><g:message code="aluminum.supplier.label" default="Supplier" /></label>
				<div class="controls">
					<g:select id="supplier" name="supplier.id" from="${stakeholder.Supplier.list()}" optionKey="id" value="${aluminumInstance?.supplier?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'supplier', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'supplierCode', 'error')} ">
				<label for="supplierCode" class="control-label"><g:message code="aluminum.supplierCode.label" default="Supplier Code" /></label>
				<div class="controls">
					<g:textField name="supplierCode" value="${aluminumInstance?.supplierCode}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'supplierCode', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'codePerCustomer', 'error')} ">
				<label for="codePerCustomer" class="control-label"><g:message code="aluminum.codePerCustomer.label" default="Code Per Customer" /></label>
				<div class="controls">
					
					<g:render template="/_abstractProduct/codePerCustomerForm" model="['productInstance':aluminumInstance]"/>

					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'codePerCustomer', 'error')}</span>
				</div>
			</div>
									
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'mold', 'error')}">
				<label for="mold" class="control-label"><g:message code="aluminum.mold.label" default="Mold" /></label>
				<div class="controls">
					<g:select name="mold" from="${aluminumInstance.constraints.mold.inList}" noSelection="['':'']" value="${fieldValue(bean: aluminumInstance, field: 'mold')}" valueMessagePrefix="aluminum.mold"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'mold', 'error')}</span>
				</div>
			</div>

			<div id="divMoldCustomer" class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'moldCustomer', 'error')} ">
				<div class="controls">
					<g:select name="moldCustomer" from="${stakeholder.Customer.list()}" multiple="multiple" optionKey="id" size="5" value="${aluminumInstance?.moldCustomer*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'moldCustomer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'originalPlane', 'error')}">
				<label for="originalPlane" class="control-label"><g:message code="aluminum.originalPlane.label" default="Original Plane" /></label>
				<div class="controls">
					<g:select name="originalPlane" from="${aluminumInstance.constraints.originalPlane.inList}" noSelection="['':'']" value="${fieldValue(bean: aluminumInstance, field: 'originalPlane')}" valueMessagePrefix="aluminum.originalPlane"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'originalPlane', 'error')}</span>
				</div>
			</div>

			<div id="divOriginalPlaneSupplier" class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'originalPlaneSupplier', 'error')} ">
				<div class="controls">
					<g:select name="originalPlaneSupplier" from="${stakeholder.Supplier.list()}" multiple="multiple" optionKey="id" size="5" value="${aluminumInstance?.originalPlaneSupplier*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'originalPlaneSupplier', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'temple', 'error')} ">
				<label for="temple" class="control-label"><g:message code="aluminum.temple.label" default="Temple" /></label>
				<div class="controls">
					<g:select id="temple" name="temple.id" from="${product.Temple.list()}" optionKey="id" value="${aluminumInstance?.temple?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'temple', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'finish', 'error')} ">
				<label for="finish" class="control-label"><g:message code="aluminum.finish.label" default="Finish" /></label>
				<div class="controls">
					<g:select id="finish" name="finish.id" from="${product.Finish.list()}" optionKey="id" value="${aluminumInstance?.finish?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'finish', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'unit', 'error')} ">
				<label for="unit" class="control-label"><g:message code="product.unit.label" default="Unit Of Sale" /></label>
				<div class="controls">
					<g:select id="unit" name="unit.id" from="${product.ItemUnit.list()}" optionKey="id" value="${aluminumInstance?.unit?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'unit', 'error')}</span>
				</div>
			</div>			

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'currency', 'error')} ">
				<label for="currency" class="control-label"><g:message code="currency.label" default="Currency" /></label>
				<div class="controls">
					<g:select id="currency" name="currency.id" from="${modal.Currency.list()}" optionKey="id" value="${aluminumInstance?.currency?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'currency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'priceCondition', 'error')} ">
				<label for="priceCondition" class="control-label"><g:message code="priceCondition.label" default="Price Condition" /></label>
				<div class="controls">
					<g:select id="priceCondition" name="priceCondition.id" from="${modal.PriceCondition.list()}" optionKey="id" value="${aluminumInstance?.priceCondition?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'priceCondition', 'error')}</span>
				</div>
			</div>
	
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'port', 'error')} ">
				<label for="port" class="control-label"><g:message code="port.label" default="Port" /></label>
				<div class="controls">
					<g:select id="port" name="port.id" from="${modal.Port.list()}" optionKey="id" value="${aluminumInstance?.port?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'port', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'consolidationArea', 'error')} ">
				<label for="consolidationArea" class="control-label"><g:message code="product.consolidationArea.label" default="Consolidation Area" /></label>
				<div class="controls">
					<g:select id="consolidationArea" name="consolidationArea.id" from="${modal.Port.list()}" optionKey="id" value="${aluminumInstance?.consolidationArea?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'consolidationArea', 'error')}</span>
				</div>
			</div>
		
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'externalProfileL', 'error')} ">
				<label for="externalProfile" class="control-label"><g:message code="aluminum.externalProfileDimension.label" default="External Profile Dimension" /></label>
				<div class="controls">
					<g:field class="input-mini" type="number" name="externalProfileL" step="0.01" min="0.0000" value="${aluminumInstance.externalProfileL}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'externalProfileL', 'error')}</span>
					x 
					<g:field class="input-mini" type="number" name="externalProfileW" step="0.01" min="0.0000" value="${aluminumInstance.externalProfileW}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'externalProfileW', 'error')}</span>
				</div>
			</div>
					
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'pcsBundle', 'error')} ">
				<label for="pcsBundle" class="control-label"><g:message code="aluminum.pcsBundle.label" default="Pcs Bundle" /></label>
				<div class="controls">
					<g:field type="number" name="pcsBundle" min="0" value="${aluminumInstance.pcsBundle}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'pcsBundle', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'sectionalL', 'error')} ">
				<label for="sectionalL" class="control-label"><g:message code="aluminum.sectionalL.label" default="Sectional L" /></label>
				<div class="controls">
					<g:field type="number" name="sectionalL" step="0.0001" min="0.0000" value="${aluminumInstance.sectionalL}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'sectionalL', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'sectionalW', 'error')} ">
				<label for="sectionalW" class="control-label"><g:message code="aluminum.sectionalW.label" default="Sectional W" /></label>
				<div class="controls">
					<g:field type="number" name="sectionalW" step="0.0001" min="0.0000" value="${aluminumInstance.sectionalW}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'sectionalW', 'error')}</span>
				</div>
			</div>
													
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'length', 'error')} ">
				<label for="length" class="control-label"><g:message code="aluminum.length.label" default="Length" /></label>
				<div class="controls">
					<g:field type="number" name="length" step="0.0001" min="0.0000" value="${aluminumInstance.length}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'length', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'theoricalWeight', 'error')} ">
				<label for="theoricalWeight" class="control-label"><g:message code="aluminum.theoricalWeight.label" default="Theorical Weight" /></label>
				<div class="controls">
					<g:field type="number" name="theoricalWeight" step="0.0001" min="0.0000" value="${aluminumInstance.theoricalWeight}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'theoricalWeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'realWeight', 'error')} ">
				<label for="realWeight" class="control-label"><g:message code="aluminum.realWeight.label" default="Real Weight" /></label>
				<div class="controls">
					<g:field type="number" name="realWeight" step="0.0001" min="0.0000" value="${aluminumInstance.realWeight}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'realWeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'articlesPerContainer', 'error')} ">
				<label for="articlesPerContainer" class="control-label"><g:message code="aluminum.articlesPerContainer.label" default="Articles Per Container" /></label>
				<div class="controls">
					<g:field type="number" name="articlesPerContainer" min="0" value="${aluminumInstance.articlesPerContainer}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'articlesPerContainer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'netWeightPerBox', 'error')} ">
				<label for="netWeightPerBox" class="control-label"><g:message code="aluminum.netWeightPerBox.label" default="Net Weight Per Box" /></label>
				<div class="controls">
					<g:field type="number" name="netWeightPerBox" step="0.0001" min="0.0000" value="${aluminumInstance.netWeightPerBox}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'netWeightPerBox', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'grossWeightPerBox', 'error')} ">
				<label for="grossWeightPerBox" class="control-label"><g:message code="aluminum.grossWeightPerBox.label" default="Gross Weight Per Box" /></label>
				<div class="controls">
					<g:field type="number" name="grossWeightPerBox" step="0.0001" min="0.0000" value="${aluminumInstance.grossWeightPerBox}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'grossWeightPerBox', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumInstance, field: 'volumenPerBox', 'error')} ">
				<label for="volumenPerBox" class="control-label"><g:message code="aluminum.volumenPerBox.label" default="Volumen Per Box" /></label>
				<div class="controls">
					<g:field type="number" name="volumenPerBox" step="0.0001" min="0.0000" value="${aluminumInstance.volumenPerBox}"/>
					<span class="help-inline">${hasErrors(bean: aluminumInstance, field: 'volumenPerBox', 'error')}</span>
				</div>
			</div>

<script type="text/javascript">
		
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
	var rowsCode = ${aluminumInstance?.codePerCustomer?.size()} + 0 ;


	$(document).ready( function() {

		/* mostrar y ocultar clientes en función de la opción del molde */
		
		moldCustomerVisibility( $("#mold").val() );
		
		$("#mold").on( "change", function() {
			moldCustomerVisibility( $(this).val() );
		})

		function moldCustomerVisibility(val) {
			if ( val == 2 ) {
				$("#divMoldCustomer").show();
			}
			else {
				$("#divMoldCustomer").hide();
			}			
		}

		/* mostrar y ocultar proveedores en función de la opción del plano original*/
		originalPlaneSupplierVisibility( $("#originalPlane").val() );
		
		$("#originalPlane").on( "change", function() {
			originalPlaneSupplierVisibility( $(this).val() );
		})

		function originalPlaneSupplierVisibility(val) {
			if ( val == 2 ) {
				$("#divOriginalPlaneSupplier").show();
			}
			else {
				$("#divOriginalPlaneSupplier").hide();
			}			
		}		
	}); 

</script>

<script type="text/javascript" src="${resource(dir:'js', file:'productForm.js')}"> </script>	