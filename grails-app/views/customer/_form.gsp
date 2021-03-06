<%@ page import="stakeholder.Customer" %>

<h5><g:message code="stakeholder.companyInformation.label" default="Company information"/></h5>

<div class="row-fluid">
	<div class="span6">
			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="customer.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${customerInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="customer.telephone.label" default="Telephone"/></label>
				<div class="controls">
					<g:textField name="telephone" value="${customerInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="customer.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${customerInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'email', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'notes', 'error')} ">
				<label for="notes" class="control-label"><g:message code="stakeholder.notes.label" default="Notes" /></label>
				<div class="controls">
					<g:textArea rows="5" name="notes" value="${customerInstance?.notes}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'notes', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'prefix', 'error')} ">
				<label for="prefix" class="control-label"><g:message code="customer.prefix.label" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="prefix" value="${customerInstance?.prefix}" required=""/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'prefix', 'error')}</span>
				</div>
			</div>
			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="customer.address.label" default="Address" /></label>
				<div class="controls">
					<g:textField name="address" value="${customerInstance?.address}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'address', 'error')}</span>
				</div>
			</div>
			

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'cuit', 'error')} ">
				<label for="cuit" class="control-label"><g:message code="customer.cuit.label" default="Cuit" /></label>
				<div class="controls">
					<g:textField name="cuit" value="${customerInstance?.cuit}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'cuit', 'error')}</span>
				</div>
			</div>			
	</div>
	<div class="span6">

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'defaultReport', 'error')} required">
				<label for="defaultReport" class="control-label"><g:message code="stakeholder.defaultReport.label" default="Default Report"/><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" required="" value="${customerInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'defaultReport', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'defaultLocale', 'error')} required">
				<label for="defaultLocale" class="control-label"><g:message code="stakeholder.defaultLocale.label" default="Default Locale"/><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" required="" value="${customerInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'defaultLocale', 'error')}</span>
				</div>
			</div>
	
			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="customer.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${customerInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'group', 'error')} required">
				<label for="group" class="control-label"><g:message code="customer.group.label" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="group" name="group.id" from="${prices.CustomerGroup.list()}" optionKey="id" required="" value="${customerInstance?.group?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'group', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'province', 'error')}">
				<label for="province" class="control-label"><g:message code="customer.province.label" default="Province" /></label>
				<div class="controls">
					<g:textField name="province" value="${customerInstance?.province}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'province', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'locality', 'error')}">
				<label for="locality" class="control-label"><g:message code="customer.locality.label" default="Locality" /></label>
				<div class="controls">
					<g:textField name="locality" value="${customerInstance?.locality}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'locality', 'error')}</span>
				</div>
			</div>
			


	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'wishes', 'error')} ">
	<label for="wishes" class="control-label"><g:message code="customer.wishes.label" default="Wishes" /></label>

	<div class="controls">
		<ul class="one-to-many">
			<li class="add">
				<g:link controller="wish" action="create" params="['customer.id': customerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
			</li>
		</ul>

		<span class="help-inline">${hasErrors(bean: customerInstance, field: 'wishes', 'error')}</span>
	</div>
</div>

<g:render template="/_stakeholder/form" model="['stakeholderInstance':customerInstance]"/>

