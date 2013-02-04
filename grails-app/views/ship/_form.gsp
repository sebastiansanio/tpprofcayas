<%@ page import="modal.Ship" %>



			<div class="control-group fieldcontain ${hasErrors(bean: shipInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="ship.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${shipInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: shipInstance, field: 'name', 'error')}</span>
				</div>
			</div>

