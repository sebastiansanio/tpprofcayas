<%@ page import="prices.PriceVariable" %>



			<div class="control-group fieldcontain ${hasErrors(bean: priceVariableInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="priceVariable.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${priceVariableInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: priceVariableInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: priceVariableInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="priceVariable.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${priceVariableInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: priceVariableInstance, field: 'description', 'error')}</span>
				</div>
			</div>

