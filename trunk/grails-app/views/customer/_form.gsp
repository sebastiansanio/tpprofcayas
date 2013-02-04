<%@ page import="stakeholder.Customer" %>



			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="customer.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${customerInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'user', 'error')} ">
				<label for="user" class="control-label"><g:message code="customer.user.label" default="User" /></label>
				<div class="controls">
					<g:select id="user" name="user.id" from="${login.User.list()}" optionKey="id" value="${customerInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'user', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="customer.address.label" default="Address" /></label>
				<div class="controls">
					<g:textField name="address" value="${customerInstance?.address}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'address', 'error')}</span>
				</div>
			</div>



			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'country', 'error')} required">
				<label for="country" class="control-label"><g:message code="customer.country.label" default="Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${customerInstance?.country?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'cuit', 'error')} ">
				<label for="cuit" class="control-label"><g:message code="customer.cuit.label" default="Cuit" /></label>
				<div class="controls">
					<g:textField name="cuit" value="${customerInstance?.cuit}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'cuit', 'error')}</span>
				</div>
			</div>


