<%@ page import="stakeholder.Person" %>



			<div class="control-group fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="person.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${personInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'name', 'error')}</span>
				</div>
			</div>

