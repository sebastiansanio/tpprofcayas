<%@ page import="stakeholder.Forwarder" %>



			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="forwarder.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${forwarderInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="forwarder.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${forwarderInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="forwarder.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${forwarderInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="forwarder.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${forwarderInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'country', 'error')}</span>
				</div>
			</div>

