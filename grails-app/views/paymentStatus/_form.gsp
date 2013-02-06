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

			<div class="control-group fieldcontain ${hasErrors(bean: paymentStatusInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="paymentStatus.wishes.label" default="Wishes" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${paymentStatusInstance?.wishes?}" var="w">
    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="wish" action="create" params="['paymentStatus.id': paymentStatusInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: paymentStatusInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

