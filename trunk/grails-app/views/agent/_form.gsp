<%@ page import="stakeholder.Agent" %>

<div class="row-fluid">
	<div class="span6">
		
		<h5><g:message code="stakeholder.agentInformation.label" default="Agent information"/></h5>
		
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

		<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'defaultReport', 'error')} required">
			<label for="defaultReport" class="control-label"><g:message code="agent.defaultReport.label" default="Default Report" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" value="${agentInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: agentInstance, field: 'defaultReport', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'defaultLocale', 'error')} required">
			<label for="defaultLocale" class="control-label"><g:message code="agent.defaultLocale.label" default="Default Locale" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" value="${agentInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: agentInstance, field: 'defaultLocale', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'country', 'error')} required">
			<label for="country" class="control-label"><g:message code="agent.country.label" default="Country" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${agentInstance?.country?.id}" class="many-to-one"/>
				<span class="help-inline">${hasErrors(bean: agentInstance, field: 'country', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: agentInstance, field: 'wishes', 'error')} ">
			<label for="wishes" class="control-label"><g:message code="agent.wishes.label" default="Wishes" /></label>
			<div class="controls">
				
				<ul class="one-to-many">
					<g:each in="${agentInstance?.wishes?}" var="w">
					    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
					</g:each>
					<li class="add">
						<g:link controller="wish" action="create" params="['agent.id': agentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
					</li>
				</ul>

				<span class="help-inline">${hasErrors(bean: agentInstance, field: 'wishes', 'error')}</span>
			</div>
		</div>
	</div>
	<div class="span6">
		<g:render template="/_stakeholder/form" model="['stakeholderInstance':agentInstance]"/>
	</div>
</div>
