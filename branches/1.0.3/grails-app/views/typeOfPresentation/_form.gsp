<%@ page import="product.TypeOfPresentation" %>



			<div class="control-group fieldcontain ${hasErrors(bean: typeOfPresentationInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="typeOfPresentation.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${typeOfPresentationInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: typeOfPresentationInstance, field: 'description', 'error')}</span>
				</div>
			</div>

