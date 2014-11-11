<%@ page import="modal.PaymentTerm" %>



			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="paymentTerm.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${paymentTermInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'percentPaymentAfterDelivery', 'error')} required">
				<label for="percentPaymentAfterDelivery" class="control-label"><g:message code="paymentTerm.percentPaymentAfterDelivery.label" default="Percent Payment After Delivery" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="percentPaymentAfterDelivery" min="0" max="100" required="" value="${paymentTermInstance.percentPaymentAfterDelivery}"/>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'percentPaymentAfterDelivery', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'paymentDaysAfterTimeOfArrival', 'error')} ">
				<label for="paymentDaysAfterTimeOfArrival" class="control-label"><g:message code="paymentTerm.paymentDaysAfterTimeOfArrival.label" default="Payment Days After Time Of Arrival" /></label>
				<div class="controls">
					<g:field type="number" name="paymentDaysAfterTimeOfArrival" min="0" value="${paymentTermInstance.paymentDaysAfterTimeOfArrival}"/>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'paymentDaysAfterTimeOfArrival', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'requiresAdvancePayment', 'error')} ">
				<label for="requiresVisa" class="control-label"><g:message code="paymentTerm.requiresAdvancePayment.label" /></label>
				<div class="controls">
					<bs:checkBox name="requiresAdvancePayment" value="${paymentTermInstance?.requiresAdvancePayment}" />
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'requiresAdvancePayment', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentTermInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="paymentTerm.wishes.label" default="Wishes" /></label>
				<div class="controls">
<ul class="one-to-many">
<g:each in="${paymentTermInstance?.wishes?}" var="w">
    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="wish" action="create" params="['paymentTerm.id': paymentTermInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
</li>
</ul>
					<span class="help-inline">${hasErrors(bean: paymentTermInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

