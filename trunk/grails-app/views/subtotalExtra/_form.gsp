<%@ page import="wish.SubtotalExtra" %>



			<div class="control-group fieldcontain ${hasErrors(bean: subtotalExtraInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="subtotalExtra.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${subtotalExtraInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: subtotalExtraInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subtotalExtraInstance, field: 'equation', 'error')} required">
				<label for="equation" class="control-label"><g:message code="subtotalExtra.equation.label" default="Equation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="equation" required="" value="${subtotalExtraInstance?.equation}"/>
					<span class="help-inline">${hasErrors(bean: subtotalExtraInstance, field: 'equation', 'error')}</span>
				</div>
			</div>

