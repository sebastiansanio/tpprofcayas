<%@ page import="modal.PaymentTerm" %>



			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="paymentTerm.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${paymentTermInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="paymentTerm.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${paymentTermInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="paymentTerm.wishes.label" default="Wishes" /></label>
				<div class="controls">
					<g:select name="wishes" from="${wish.Wish.list()}" multiple="multiple" optionKey="id" size="5" value="${paymentTermInstance?.wishes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

