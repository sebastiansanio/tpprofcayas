<%@ page import="modal.Currency" %>



			<div class="control-group fieldcontain ${hasErrors(bean: currencyInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="currency.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${currencyInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: currencyInstance, field: 'name', 'error')}</span>
				</div>
			</div>

