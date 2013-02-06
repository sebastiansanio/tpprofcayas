<%@ page import="product.SubFamily" %>



			<div class="control-group fieldcontain ${hasErrors(bean: subFamilyInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="subFamily.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${subFamilyInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: subFamilyInstance, field: 'description', 'error')}</span>
				</div>
			</div>

