<%@ page import="modal.PriceCondition" %>



			<div class="control-group fieldcontain ${hasErrors(bean: priceConditionInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="priceCondition.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${priceConditionInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: priceConditionInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: priceConditionInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="priceCondition.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${priceConditionInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: priceConditionInstance, field: 'description', 'error')}</span>
				</div>
			</div>


