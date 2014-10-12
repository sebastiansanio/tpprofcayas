<%@ page import="product.Extra" %>



			<div class="control-group fieldcontain ${hasErrors(bean: extraInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="extra.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${extraInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: extraInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: extraInstance, field: 'equation', 'error')} required">
				<label for="equation" class="control-label"><g:message code="extra.equation.label" default="Equation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="equation" required="" value="${extraInstance?.equation}"/>
					<span class="help-inline">${hasErrors(bean: extraInstance, field: 'equation', 'error')}</span>
				</div>
			</div>

