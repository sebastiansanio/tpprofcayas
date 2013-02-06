<%@ page import="stakeholder.CustomsBroker" %>



			<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="customsBroker.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${customsBrokerInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="customsBroker.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${customsBrokerInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="customsBroker.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${customsBrokerInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="customsBroker.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${customsBrokerInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'country', 'error')}</span>
				</div>
			</div>

