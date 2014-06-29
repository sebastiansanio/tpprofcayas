<%@ page import="modal.Country" %>



			<div class="control-group fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="country.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${countryInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: countryInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: countryInstance, field: 'ports', 'error')} ">
				<label for="ports" class="control-label"><g:message code="country.ports.label" default="Ports" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${countryInstance?.ports?}" var="p">
    <li><g:link controller="port" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="port" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'port.label', default: 'Port')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: countryInstance, field: 'ports', 'error')}</span>
				</div>
			</div>

