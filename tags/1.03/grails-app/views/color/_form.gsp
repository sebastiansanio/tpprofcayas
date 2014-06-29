<%@ page import="product.Color" %>



			<div class="control-group fieldcontain ${hasErrors(bean: colorInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="color.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${colorInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: colorInstance, field: 'description', 'error')}</span>
				</div>
			</div>

