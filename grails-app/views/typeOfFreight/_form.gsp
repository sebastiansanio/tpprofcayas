<%@ page import="modal.TypeOfFreight" %>



			<div class="control-group fieldcontain ${hasErrors(bean: typeOfFreightInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="typeOfFreight.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${typeOfFreightInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: typeOfFreightInstance, field: 'name', 'error')}</span>
				</div>
			</div>

