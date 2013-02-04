<%@ page import="stakeholder.Supplier" %>



			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="supplier.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${supplierInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'user', 'error')} ">
				<label for="user" class="control-label"><g:message code="supplier.user.label" default="User" /></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${login.User.list()}" optionKey="id" value="${supplierInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'user', 'error')}</span>
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

