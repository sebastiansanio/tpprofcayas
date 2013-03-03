<%@ page import="stakeholder.Supplier" %>



			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="supplier.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${supplierInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="supplier.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${supplierInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="supplier.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${supplierInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'defaultReport', 'error')} ">
				<label for="defaultReport" class="control-label"><g:message code="supplier.defaultReport.label" default="Default Report" /></label>
				<div class="controls">
					<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" value="${supplierInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'defaultReport', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'defaultLocale', 'error')} ">
				<label for="defaultLocale" class="control-label"><g:message code="supplier.defaultLocale.label" default="Default Locale" /></label>
				<div class="controls">
					<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" value="${supplierInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'defaultLocale', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="supplier.address.label" default="Address" /></label>
				<div class="controls">
					<g:textField name="address" value="${supplierInstance?.address}"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'address', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="supplier.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${supplierInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'taxRegistryNumber', 'error')} ">
				<label for="taxRegistryNumber" class="control-label"><g:message code="supplier.taxRegistryNumber.label" default="Tax Registry Number" /></label>
				<div class="controls">
					<g:textField name="taxRegistryNumber" value="${supplierInstance?.taxRegistryNumber}"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'taxRegistryNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="supplier.wishes.label" default="Wishes" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${supplierInstance?.wishes?}" var="w">
    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="wish" action="create" params="['supplier.id': supplierInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

