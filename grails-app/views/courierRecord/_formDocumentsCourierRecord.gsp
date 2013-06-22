<%@ page import="courier.DocumentsCourierRecord" %>



			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'courier', 'error')} required">
				<label for="courier" class="control-label"><g:message code="documentsCourierRecord.courier.label" default="Courier" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="courier" name="courier.id" from="${courier.Courier.list()}" optionKey="id" required="" value="${documentsCourierRecordInstance?.courier?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'courier', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'trackingNumber', 'error')} required">
				<label for="trackingNumber" class="control-label"><g:message code="documentsCourierRecord.trackingNumber.label" default="Tracking Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="trackingNumber" required="" value="${documentsCourierRecordInstance?.trackingNumber}"/>
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'trackingNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'departureDate', 'error')} ">
				<label for="departureDate" class="control-label"><g:message code="documentsCourierRecord.departureDate.label" default="Departure Date" /></label>
				<div class="controls">
					<bs:datePicker name="departureDate" precision="day"  value="${documentsCourierRecordInstance?.departureDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'departureDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'estimatedArrivalDate', 'error')} ">
				<label for="estimatedArrivalDate" class="control-label"><g:message code="documentsCourierRecord.estimatedArrivalDate.label" default="Estimated Arrival Date" /></label>
				<div class="controls">
					<bs:datePicker name="estimatedArrivalDate" precision="day"  value="${documentsCourierRecordInstance?.estimatedArrivalDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'estimatedArrivalDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'arrivalDate', 'error')} ">
				<label for="arrivalDate" class="control-label"><g:message code="documentsCourierRecord.arrivalDate.label" default="Arrival Date" /></label>
				<div class="controls">
					<bs:datePicker name="arrivalDate" precision="day"  value="${documentsCourierRecordInstance?.arrivalDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'arrivalDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'costsInChargeOf', 'error')} ">
				<label for="costsInChargeOf" class="control-label"><g:message code="documentsCourierRecord.costsInChargeOf.label" default="Costs In Charge Of" /></label>
				<div class="controls">
					<g:select name="costsInChargeOf" from="${documentsCourierRecordInstance.constraints.costsInChargeOf.inList}" value="${documentsCourierRecordInstance?.costsInChargeOf}" valueMessagePrefix="documentsCourierRecord.costsInChargeOf" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'costsInChargeOf', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'aditionalCosts', 'error')} ">
				<label for="aditionalCosts" class="control-label"><g:message code="documentsCourierRecord.aditionalCosts.label" default="Aditional Costs" /></label>
				<div class="controls">
					<g:textField name="aditionalCosts" value="${documentsCourierRecordInstance?.aditionalCosts}"/>
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'aditionalCosts', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'observations', 'error')} ">
				<label for="observations" class="control-label"><g:message code="documentsCourierRecord.observations.label" default="Observations" /></label>
				<div class="controls">
					<g:textField name="observations" value="${documentsCourierRecordInstance?.observations}"/>
					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'observations', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentsCourierRecordInstance, field: 'documents', 'error')} ">
				<label for="documents" class="control-label"><g:message code="documentsCourierRecord.documents.label" default="Documents" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${documentsCourierRecordInstance?.documents?}" var="d">
    <li><g:link controller="document" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="document" action="create" params="['documentsCourierRecord.id': documentsCourierRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'document.label', default: 'Document')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: documentsCourierRecordInstance, field: 'documents', 'error')}</span>
				</div>
			</div>


