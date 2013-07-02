<%@ page import="modal.TypeOfFreight" %>



			<div class="control-group fieldcontain ${hasErrors(bean: typeOfFreightInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="typeOfFreight.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${typeOfFreightInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: typeOfFreightInstance, field: 'name', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: typeOfFreightInstance, field: 'requiresPicturesOfLoadingContainer', 'error')} ">
				<label for="requiresPicturesOfLoadingContainer" class="control-label"><g:message code="typeOfFreight.requiresPicturesOfLoadingContainer.label" /></label>
				<div class="controls">
					<bs:checkBox name="requiresPicturesOfLoadingContainer" value="${typeOfFreightInstance?.requiresPicturesOfLoadingContainer}" />
					<span class="help-inline">${hasErrors(bean: typeOfFreightInstance, field: 'requiresPicturesOfLoadingContainer', 'error')}</span>
				</div>
			</div>
			

