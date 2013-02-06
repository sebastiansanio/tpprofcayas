<%@ page import="stakeholder.Agent" %>



			<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="agent.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${agentInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: agentInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="agent.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${agentInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: agentInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="agent.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${agentInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: agentInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="agent.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${agentInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: agentInstance, field: 'country', 'error')}</span>
				</div>
			</div>

