<%@ page import="stakeholder.Forwarder" %>

<h5><g:message code="stakeholder.forwarderInformation.label" default="Forwarder information"/></h5>

<div class="row-fluid">
	<div class="span6">
		
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
		
		<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'notes', 'error')} ">
			<label for="notes" class="control-label"><g:message code="stakeholder.notes.label" default="Notes" /></label>
			<div class="controls">
				<g:textArea rows="5" name="notes" value="${forwarderInstance?.notes}"/>
				<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'notes', 'error')}</span>
			</div>
		</div>
	</div>
	<div class="span6">
	
		<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'defaultReport', 'error')} required">
			<label for="defaultReport" class="control-label"><g:message code="forwarder.defaultReport.label" default="Default Report" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" value="${forwarderInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'defaultReport', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'defaultLocale', 'error')} required">
			<label for="defaultLocale" class="control-label"><g:message code="forwarder.defaultLocale.label" default="Default Locale" /><span class="required-indicator">*</span></label>
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
		
		<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'province', 'error')}">
			<label for="province" class="control-label"><g:message code="customer.province.label" default="Province" /></label>
			<div class="controls">
				<g:textField name="province" value="${forwarderInstance?.province}"/>
				<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'province', 'error')}</span>
			</div>
		</div>
			
		<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'locality', 'error')}">
			<label for="locality" class="control-label"><g:message code="customer.locality.label" default="Locality" /></label>
			<div class="controls">
				<g:textField name="locality" value="${forwarderInstance?.locality}"/>
				<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'locality', 'error')}</span>
			</div>
		</div>
			
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: forwarderInstance, field: 'wishes', 'error')} ">
	<label for="wishes" class="control-label"><g:message code="forwarder.wishes.label" default="Wishes" /></label>
	<div class="controls">
		
		<ul class="one-to-many">
		
			<li class="add">
				<g:link controller="wish" action="create" params="['forwarder.id': forwarderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
			</li>
		</ul>

		<span class="help-inline">${hasErrors(bean: forwarderInstance, field: 'wishes', 'error')}</span>
	</div>
</div>
		
<g:render template="/_stakeholder/form" model="['stakeholderInstance':forwarderInstance]"/>
