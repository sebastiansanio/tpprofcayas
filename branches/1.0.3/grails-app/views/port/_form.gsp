<%@ page import="modal.Port" %>



			<div class="control-group fieldcontain ${hasErrors(bean: portInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="port.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${portInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: portInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: portInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="port.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${portInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: portInstance, field: 'name', 'error')}</span>
				</div>
			</div>

