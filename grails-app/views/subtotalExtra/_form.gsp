<%@ page import="wish.SubtotalExtra" %>

			<div class="control-group fieldcontain ${hasErrors(bean: subtotalExtraInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="subtotalExtra.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${subtotalExtraInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: subtotalExtraInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subtotalExtraInstance, field: 'number', 'error')} required">
				<label for="number" class="control-label"><g:message code="subtotalExtra.number.label" default="Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="number" step="0.0001" min="0.0000" value="${subtotalExtraInstance?.number}"/>
					<span class="help-inline">${hasErrors(bean: subtotalExtraInstance, field: 'number', 'error')}</span>
				</div>
			</div>

