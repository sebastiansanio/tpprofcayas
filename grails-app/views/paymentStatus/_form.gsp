<%@ page import="modal.PaymentStatus" %>



			<div class="control-group fieldcontain ${hasErrors(bean: paymentStatusInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="paymentStatus.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${paymentStatusInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: paymentStatusInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentStatusInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="paymentStatus.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${paymentStatusInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: paymentStatusInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentStatusInstance, field: 'whishes', 'error')} ">
				<label for="whishes" class="control-label"><g:message code="paymentStatus.whishes.label" default="Whishes" /></label>
				<div class="controls">
					<g:select name="whishes" from="${wish.Wish.list()}" multiple="multiple" optionKey="id" size="5" value="${paymentStatusInstance?.whishes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: paymentStatusInstance, field: 'whishes', 'error')}</span>
				</div>
			</div>

