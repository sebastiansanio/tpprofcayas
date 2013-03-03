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

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'defaultReport', 'error')} ">
				<label for="defaultReport" class="control-label"><g:message code="forwarder.defaultReport.label" default="Default Report" /></label>
				<div class="controls">
					<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" value="${forwarderInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'defaultReport', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'defaultLocale', 'error')} ">
				<label for="defaultLocale" class="control-label"><g:message code="forwarder.defaultLocale.label" default="Default Locale" /></label>
				<div class="controls">
					<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" value="${forwarderInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'defaultLocale', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="forwarder.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${forwarderInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="forwarder.wishes.label" default="Wishes" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${forwarderInstance?.wishes?}" var="w">
    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="wish" action="create" params="['forwarder.id': forwarderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

