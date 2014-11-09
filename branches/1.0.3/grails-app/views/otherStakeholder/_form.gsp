<%@ page import="stakeholder.OtherStakeholder" %>

<div class="row-fluid">

<div class="span5">

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="stakeholder.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${otherStakeholderInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="stakeholder.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${otherStakeholderInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="stakeholder.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${otherStakeholderInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'defaultReport', 'error')} required">
				<label for="defaultReport" class="control-label"><g:message code="stakeholder.defaultReport.label" default="Default Report" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" required="" value="${otherStakeholderInstance?.defaultReport?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'defaultReport', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'defaultLocale', 'error')} required">
				<label for="defaultLocale" class="control-label"><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" required="" value="${otherStakeholderInstance?.defaultLocale?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'defaultLocale', 'error')}</span>
				</div>
			</div>

</div>
<div class="span5">

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'province', 'error')} ">
				<label for="province" class="control-label"><g:message code="stakeholder.province.label" default="Province" /></label>
				<div class="controls">
					<g:textField name="province" value="${otherStakeholderInstance?.province}"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'province', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'locality', 'error')} ">
				<label for="locality" class="control-label"><g:message code="stakeholder.locality.label" default="Locality" /></label>
				<div class="controls">
					<g:textField name="locality" value="${otherStakeholderInstance?.locality}"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'locality', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'notes', 'error')} ">
				<label for="notes" class="control-label"><g:message code="stakeholder.notes.label" default="Notes" /></label>
				<div class="controls">
					<g:textArea rows="5" name="notes" value="${otherStakeholderInstance?.notes}"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'notes', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: otherStakeholderInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="stakeholder.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${otherStakeholderInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: otherStakeholderInstance, field: 'country', 'error')}</span>
				</div>
			</div>
</div>
</div>

<g:render template="/_stakeholder/form" model="['stakeholderInstance':otherStakeholderInstance]"/>
