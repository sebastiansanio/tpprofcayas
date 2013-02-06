<%@ page import="stakeholder.Customer" %>



			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="customer.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${customerInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="customer.telephone.label" default="Telephone" /></label>
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

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="customer.wishes.label" default="Wishes" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${customerInstance?.wishes?}" var="w">
    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="wish" action="create" params="['customer.id': customerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

