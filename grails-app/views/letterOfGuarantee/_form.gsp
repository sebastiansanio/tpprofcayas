<%@ page import="wish.LetterOfGuarantee" %>

			<div class="control-group fieldcontain ${hasErrors(bean: letterOfGuaranteeInstance, field: 'customer', 'error')} required">
				<label for="customer" class="control-label"><g:message code="letterOfGuarantee.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customer" name="customer.id" from="${stakeholder.Customer.list()}" optionKey="id" required="" value="${letterOfGuaranteeInstance?.customer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: letterOfGuaranteeInstance, field: 'customer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: letterOfGuaranteeInstance, field: 'forwarder', 'error')} required">
				<label for="forwarder" class="control-label"><g:message code="letterOfGuarantee.forwarder.label" default="Forwarder" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="forwarder" name="forwarder.id" from="${stakeholder.Forwarder.list()}" optionKey="id" required="" value="${letterOfGuaranteeInstance?.forwarder?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: letterOfGuaranteeInstance, field: 'forwarder', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: letterOfGuaranteeInstance, field: 'year', 'error')} required">
				<label for="year" class="control-label"><g:message code="letterOfGuarantee.year.label" default="Year" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="year" required="" value="${letterOfGuaranteeInstance.year}"/>
					<span class="help-inline">${hasErrors(bean: letterOfGuaranteeInstance, field: 'year', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: letterOfGuaranteeInstance, field: 'deliveryDate', 'error')} ">
				<label for="deliveryDate" class="control-label"><g:message code="letterOfGuarantee.deliveryDate.label" default="Delivery Date" /></label>
				<div class="controls">
					<bs:datePicker name="deliveryDate" precision="day"  value="${letterOfGuaranteeInstance?.deliveryDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: letterOfGuaranteeInstance, field: 'deliveryDate', 'error')}</span>
				</div>
			</div>
