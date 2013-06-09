<%@ page import="stakeholder.CustomsBroker" %>
<h5><g:message code="stakeholder.customsBrokerInformation.label" default="Custom broker information"/></h5>

<div class="row-fluid">
	<div class="span6">
		
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
		
		<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'notes', 'error')} ">
			<label for="notes" class="control-label"><g:message code="stakeholder.notes.label" default="Notes" /></label>
			<div class="controls">
				<g:textArea rows="5" name="notes" value="${customsBrokerInstance?.notes}"/>
				<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'notes', 'error')}</span>
			</div>
		</div>

	</div>
	<div class="span6">
	
		<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'defaultReport', 'error')} required">
			<label for="defaultReport" class="control-label"><g:message code="customsBroker.defaultReport.label" default="Default Report" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" required="" value="${customsBrokerInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'defaultReport', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'defaultLocale', 'error')} required">
			<label for="defaultLocale" class="control-label"><g:message code="customsBroker.defaultLocale.label" default="Default Locale" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" value="${customsBrokerInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'defaultLocale', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'country', 'error')} required">
			<label for="country" class="control-label"><g:message code="customsBroker.country.label" default="Country" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${customsBrokerInstance?.country?.id}" class="many-to-one"/>
				<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'country', 'error')}</span>
			</div>
		</div>
		
		<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'province', 'error')}">
			<label for="province" class="control-label"><g:message code="customer.province.label" default="Province" /></label>
			<div class="controls">
				<g:textField name="province" value="${customsBrokerInstance?.province}"/>
				<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'province', 'error')}</span>
			</div>
		</div>
			
		<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'locality', 'error')}">
			<label for="locality" class="control-label"><g:message code="customer.locality.label" default="Locality" /></label>
			<div class="controls">
				<g:textField name="locality" value="${customsBrokerInstance?.locality}"/>
				<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'locality', 'error')}</span>
			</div>
		</div>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: customsBrokerInstance, field: 'wishes', 'error')} ">
	<label for="wishes" class="control-label"><g:message code="customsBroker.wishes.label" default="Wishes" /></label>
	<div class="controls">
		
		<ul class="one-to-many">

			<li class="add">
				<g:link controller="wish" action="create" params="['customsBroker.id': customsBrokerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
			</li>
		</ul>

		<span class="help-inline">${hasErrors(bean: customsBrokerInstance, field: 'wishes', 'error')}</span>
	</div>
</div>

<g:render template="/_stakeholder/form" model="['stakeholderInstance':customsBrokerInstance]"/>