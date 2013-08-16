<%@ page import="product.ItemState" %>



			<div class="control-group fieldcontain ${hasErrors(bean: itemStateInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="itemState.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${itemStateInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: itemStateInstance, field: 'description', 'error')}</span>
				</div>
			</div>

