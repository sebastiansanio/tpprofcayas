<%@ page import="prices.CustomerGroup" %>



			<div class="control-group fieldcontain ${hasErrors(bean: customerGroupInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="customerGroup.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${customerGroupInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: customerGroupInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerGroupInstance, field: 'customers', 'error')} ">
				<label for="customers" class="control-label"><g:message code="customerGroup.customers.label" default="Customers" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${customerGroupInstance?.customers?}" var="c">
    <li><g:link controller="customer" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="customer" action="create" params="['customerGroup.id': customerGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'customer.label', default: 'Customer')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: customerGroupInstance, field: 'customers', 'error')}</span>
				</div>
			</div>

