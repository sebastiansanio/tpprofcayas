<%@ page import="wish.SubtotalExtra" %>



			<div class="control-group fieldcontain ${hasErrors(bean: subtotalExtraInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="subtotalExtra.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${subtotalExtraInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: subtotalExtraInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: extraInstance, field: 'equation', 'error')} required">
				<p>${message(code:"extra.ecuation.description", default:"")}</p>

				<div class="atributos">
					<span class="badge badge-info" data-name="subtotal">${message(code: 'aluminumSubwish.subtotal.label', default: 'Subtotal')}</span>

				</div>

				<label for="equation" class="control-label"><g:message code="subtotalExtra.equation.label" default="Equation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="equation" required="" row="5" value="${subtotalExtraInstance?.equation}"/>
					<span class="help-inline">${hasErrors(bean: subtotalExtraInstance, field: 'equation', 'error')}</span>
				</div>
			</div>

