<%@ page import="stakeholder.Shipper" %>



			<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="shipper.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${shipperInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="shipper.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${shipperInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="shipper.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${shipperInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="shipper.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${shipperInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'country', 'error')}</span>
				</div>
			</div>

