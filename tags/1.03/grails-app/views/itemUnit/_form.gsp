<%@ page import="product.ItemUnit" %>



			<div class="control-group fieldcontain ${hasErrors(bean: itemUnitInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="itemUnit.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${itemUnitInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: itemUnitInstance, field: 'description', 'error')}</span>
				</div>
			</div>

