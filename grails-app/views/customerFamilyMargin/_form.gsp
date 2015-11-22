<%@ page import="stakeholder.CustomerFamilyMargin" %>

			<div class="control-group fieldcontain ${hasErrors(bean: customerFamilyMarginInstance, field: 'customer', 'error')} required">
				<label for="customer" class="control-label"><g:message code="customerFamilyMargin.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customer" name="customer.id" from="${stakeholder.Customer.list()}" optionKey="id" required="" value="${customerFamilyMarginInstance?.customer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerFamilyMarginInstance, field: 'customer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerFamilyMarginInstance, field: 'family', 'error')} required">
				<label for="family" class="control-label"><g:message code="customerFamilyMargin.family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${product.Family.list()}" optionKey="id" required="" value="${customerFamilyMarginInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerFamilyMarginInstance, field: 'family', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerFamilyMarginInstance, field: 'margin', 'error')} required">
				<label for="margin" class="control-label"><g:message code="customerFamilyMargin.margin.label" default="Margin" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="margin" step="0.0001" min="0.0000" required="" value="${customerFamilyMarginInstance.margin}"/>
					<span class="help-inline">${hasErrors(bean: customerFamilyMarginInstance, field: 'margin', 'error')}</span>
				</div>
			</div>


