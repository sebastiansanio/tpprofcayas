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

