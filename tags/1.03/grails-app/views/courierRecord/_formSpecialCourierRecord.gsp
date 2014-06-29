<%@ page import="courier.SpecialCourierRecord" %>

<div class="row-fluid">
<div class="span3">

			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'courier', 'error')} required">
				<label for="courier" class="control-label"><g:message code="courierRecord.courier.label" default="Courier" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="courier" name="courier.id" from="${courier.Courier.list()}" optionKey="id" required="" value="${specialCourierRecordInstance?.courier?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'courier', 'error')}</span>
				</div>
			</div>

			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'trackingNumber', 'error')} required">
				<label for="trackingNumber" class="control-label"><g:message code="courierRecord.trackingNumber.label" default="Tracking Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="trackingNumber" required="" value="${specialCourierRecordInstance?.trackingNumber}"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'trackingNumber', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'source', 'error')} ">
				<label for="source" class="control-label"><g:message code="courierRecord.source.label" default="Source" /></label>
				<div class="controls">
					<g:textField name="source" value="${specialCourierRecordInstance?.source}"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'source', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'destination', 'error')} ">
				<label for="destination" class="control-label"><g:message code="courierRecord.destination.label" default="Destination" /></label>
				<div class="controls">
					<g:textField name="destination" value="${specialCourierRecordInstance?.destination}"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'destination', 'error')}</span>
				</div>
			</div>
			

			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="courierRecord.description.label" default="Description" /></label>
				<div class="controls">
					<g:textArea rows="5" name="description" value="${specialCourierRecordInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'description', 'error')}</span>
				</div>
			</div>

</div>
<div class="span3">


			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'departureDate', 'error')} ">
				<label for="departureDate" class="control-label"><g:message code="courierRecord.departureDate.label" default="Departure Date" /></label>
				<div class="controls">
					<bs:datePicker name="departureDate" precision="day"  value="${specialCourierRecordInstance?.departureDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'departureDate', 'error')}</span>
				</div>
			</div>

			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'estimatedArrivalDate', 'error')} ">
				<label for="estimatedArrivalDate" class="control-label"><g:message code="courierRecord.estimatedArrivalDate.label" default="Estimated Arrival Date" /></label>
				<div class="controls">
					<bs:datePicker name="estimatedArrivalDate" precision="day"  value="${specialCourierRecordInstance?.estimatedArrivalDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'estimatedArrivalDate', 'error')}</span>
				</div>
			</div>


			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'arrivalDate', 'error')} ">
				<label for="arrivalDate" class="control-label"><g:message code="courierRecord.arrivalDate.label" default="Arrival Date" /></label>
				<div class="controls">
					<bs:datePicker name="arrivalDate" precision="day"  value="${specialCourierRecordInstance?.arrivalDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'arrivalDate', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'requiresVisa', 'error')} ">
				<label for="requiresVisa" class="control-label"><g:message code="courierRecord.requiresVisa.label" default="Requires Visa" /></label>
				<div class="controls">
					<bs:checkBox name="requiresVisa" value="${specialCourierRecordInstance?.requiresVisa}" />
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'requiresVisa', 'error')}</span>
				</div>
			</div>
			
			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'costsInChargeOf', 'error')} ">
				<label for="costsInChargeOf" class="control-label"><g:message code="courierRecord.costsInChargeOf.label" default="Costs In Charge Of" /></label>
				<div class="controls">
					<g:select name="costsInChargeOf" from="${specialCourierRecordInstance.constraints.costsInChargeOf.inList}" value="${specialCourierRecordInstance?.costsInChargeOf}" valueMessagePrefix="courierRecord.costsInChargeOf" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'costsInChargeOf', 'error')}</span>
				</div>
			</div>

			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'aditionalCosts', 'error')} ">
				<label for="aditionalCosts" class="control-label"><g:message code="courierRecord.aditionalCosts.label" default="Aditional Costs" /></label>
				<div class="controls">
					<g:textField name="aditionalCosts" value="${specialCourierRecordInstance?.aditionalCosts}"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'aditionalCosts', 'error')}</span>
				</div>
			</div>

</div>
<div class="span3">


			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'observations', 'error')} ">
				<label for="observations" class="control-label"><g:message code="courierRecord.observations.label" default="Observations" /></label>
				<div class="controls">
					<g:textArea rows="5" name="observations" value="${specialCourierRecordInstance?.observations}"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'observations', 'error')}</span>
				</div>
			</div>


			<div class=" fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'issuer', 'error')} ">
				<label for="issuer" class="control-label"><g:message code="courierRecord.issuer.label" default="Issuer" /></label>
				<div class="controls">
					<g:select id="issuer" name="issuer.id" from="${stakeholder.Stakeholder.list(sort:'name')}" optionKey="id" value="${specialCourierRecordInstance?.issuer?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'issuer', 'error')}</span>
				</div>
			</div>



			<div class="fieldcontain ${hasErrors(bean: specialCourierRecordInstance, field: 'receivers', 'error')} ">
				<label for="receivers" class="control-label"><g:message code="courierRecord.receivers.label" default="Receivers" /></label>
				<div class="controls">
					<g:select name="receivers" from="${stakeholder.Stakeholder.list(sort:'name')}" multiple="multiple" optionKey="id" size="10" value="${specialCourierRecordInstance?.receivers*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: specialCourierRecordInstance, field: 'receivers', 'error')}</span>
				</div>
			</div>

</div>
</div>