<%@ page import="prices.SupplierPriceCriteria" %>



			<div class="control-group fieldcontain ${hasErrors(bean: supplierPriceCriteriaInstance, field: 'product', 'error')} required">
				<label for="product" class="control-label"><g:message code="supplierPriceCriteria.product.label" default="Product" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="product" name="product.id" from="${product.Product.list()}" optionKey="id" required="" value="${supplierPriceCriteriaInstance?.product?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: supplierPriceCriteriaInstance, field: 'product', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierPriceCriteriaInstance, field: 'variable', 'error')} ">
				<label for="variable" class="control-label"><g:message code="supplierPriceCriteria.variable.label" default="Variable" /></label>
				<div class="controls">
					<g:select id="variable" name="variable.id" from="${prices.PriceVariable.list()}" optionKey="id" value="${supplierPriceCriteriaInstance?.variable?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: supplierPriceCriteriaInstance, field: 'variable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierPriceCriteriaInstance, field: 'priceVariableFrom', 'error')} ">
				<label for="priceVariableFrom" class="control-label"><g:message code="supplierPriceCriteria.priceVariableFrom.label" default="Price Variable From" /></label>
				<div class="controls">
					<g:field type="number" name="priceVariableFrom" step="any" value="${supplierPriceCriteriaInstance.priceVariableFrom}"/>
					<span class="help-inline">${hasErrors(bean: supplierPriceCriteriaInstance, field: 'priceVariableFrom', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierPriceCriteriaInstance, field: 'priceVariableTo', 'error')} ">
				<label for="priceVariableTo" class="control-label"><g:message code="supplierPriceCriteria.priceVariableTo.label" default="Price Variable To" /></label>
				<div class="controls">
					<g:field type="number" name="priceVariableTo" step="any" value="${supplierPriceCriteriaInstance.priceVariableTo}"/>
					<span class="help-inline">${hasErrors(bean: supplierPriceCriteriaInstance, field: 'priceVariableTo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierPriceCriteriaInstance, field: 'basePrice1', 'error')} required">
				<label for="basePrice1" class="control-label"><g:message code="supplierPriceCriteria.basePrice1.label" default="Base Price1" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="basePrice1" step="any" required="" value="${supplierPriceCriteriaInstance.basePrice1}"/>
					<span class="help-inline">${hasErrors(bean: supplierPriceCriteriaInstance, field: 'basePrice1', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierPriceCriteriaInstance, field: 'basePrice2', 'error')} required">
				<label for="basePrice2" class="control-label"><g:message code="supplierPriceCriteria.basePrice2.label" default="Base Price2" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="basePrice2" step="any" required="" value="${supplierPriceCriteriaInstance.basePrice2}"/>
					<span class="help-inline">${hasErrors(bean: supplierPriceCriteriaInstance, field: 'basePrice2', 'error')}</span>
				</div>
			</div>

