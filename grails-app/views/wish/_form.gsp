<%@ page import="wish.Wish" %>



			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'estimatedDeliveryDate', 'error')} ">
				<label for="estimatedDeliveryDate" class="control-label"><g:message code="wish.estimatedDeliveryDate.label" default="Estimated Delivery Date" /></label>
				<div class="controls">
					<bs:datePicker name="estimatedDeliveryDate" precision="day"  value="${wishInstance?.estimatedDeliveryDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'estimatedDeliveryDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'agent', 'error')} required">
				<label for="agent" class="control-label"><g:message code="wish.agent.label" default="Agent" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="agent" name="agent.id" from="${stakeholder.Agent.list()}" optionKey="id" required="" value="${wishInstance?.agent?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'agent', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'amountOfMoneyInAdvanceTransferred', 'error')} required">
				<label for="amountOfMoneyInAdvanceTransferred" class="control-label"><g:message code="wish.amountOfMoneyInAdvanceTransferred.label" default="Amount Of Money In Advance Transferred" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="amountOfMoneyInAdvanceTransferred" step="any" required="" value="${wishInstance.amountOfMoneyInAdvanceTransferred}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'amountOfMoneyInAdvanceTransferred', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'bill', 'error')} required">
				<label for="bill" class="control-label"><g:message code="wish.bill.label" default="Bill" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="bill" required="" value="${wishInstance.bill}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'bill', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'blNumber', 'error')} required">
				<label for="blNumber" class="control-label"><g:message code="wish.blNumber.label" default="Bl Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="blNumber" required="" value="${wishInstance.blNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'blNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'cartonPrintingInfo', 'error')} ">
				<label for="cartonPrintingInfo" class="control-label"><g:message code="wish.cartonPrintingInfo.label" default="Carton Printing Info" /></label>
				<div class="controls">
					<g:textField name="cartonPrintingInfo" value="${wishInstance?.cartonPrintingInfo}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'cartonPrintingInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'cbm', 'error')} required">
				<label for="cbm" class="control-label"><g:message code="wish.cbm.label" default="Cbm" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="cbm" step="any" required="" value="${wishInstance.cbm}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'cbm', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'ciTaxAndCuitVerification', 'error')} ">
				<label for="ciTaxAndCuitVerification" class="control-label"><g:message code="wish.ciTaxAndCuitVerification.label" default="Ci Tax And Cuit Verification" /></label>
				<div class="controls">
					<bs:checkBox name="ciTaxAndCuitVerification" value="${wishInstance?.ciTaxAndCuitVerification}" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'ciTaxAndCuitVerification', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'clientOpNumber', 'error')} required">
				<label for="clientOpNumber" class="control-label"><g:message code="wish.clientOpNumber.label" default="Client Op Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="clientOpNumber" required="" value="${wishInstance.clientOpNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'clientOpNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'conversion', 'error')} required">
				<label for="conversion" class="control-label"><g:message code="wish.conversion.label" default="Conversion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="conversion" step="any" required="" value="${wishInstance.conversion}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'conversion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'criterionValue', 'error')} required">
				<label for="criterionValue" class="control-label"><g:message code="wish.criterionValue.label" default="Criterion Value" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="criterionValue" name="criterionValue.id" from="${modal.CriterionValue.list()}" optionKey="id" required="" value="${wishInstance?.criterionValue?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'criterionValue', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'currency', 'error')} required">
				<label for="currency" class="control-label"><g:message code="wish.currency.label" default="Currency" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="currency" name="currency.id" from="${modal.Currency.list()}" optionKey="id" required="" value="${wishInstance?.currency?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'currency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'currencyFob', 'error')} required">
				<label for="currencyFob" class="control-label"><g:message code="wish.currencyFob.label" default="Currency Fob" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="currencyFob" step="any" required="" value="${wishInstance.currencyFob}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'currencyFob', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customer', 'error')} required">
				<label for="customer" class="control-label"><g:message code="wish.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customer" name="customer.id" from="${stakeholder.Customer.list()}" optionKey="id" required="" value="${wishInstance?.customer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customerLogoPunch', 'error')} ">
				<label for="customerLogoPunch" class="control-label"><g:message code="wish.customerLogoPunch.label" default="Customer Logo Punch" /></label>
				<div class="controls">
					<bs:checkBox name="customerLogoPunch" value="${wishInstance?.customerLogoPunch}" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customerLogoPunch', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customsBroker', 'error')} required">
				<label for="customsBroker" class="control-label"><g:message code="wish.customsBroker.label" default="Customs Broker" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customsBroker" name="customsBroker.id" from="${stakeholder.CustomsBroker.list()}" optionKey="id" required="" value="${wishInstance?.customsBroker?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customsBroker', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customsBrokerRefNumber', 'error')} ">
				<label for="customsBrokerRefNumber" class="control-label"><g:message code="wish.customsBrokerRefNumber.label" default="Customs Broker Ref Number" /></label>
				<div class="controls">
					<g:textField name="customsBrokerRefNumber" value="${wishInstance?.customsBrokerRefNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customsBrokerRefNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dateOfBalancePayment', 'error')} required">
				<label for="dateOfBalancePayment" class="control-label"><g:message code="wish.dateOfBalancePayment.label" default="Date Of Balance Payment" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="dateOfBalancePayment" precision="day"  value="${wishInstance?.dateOfBalancePayment}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dateOfBalancePayment', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dateOfMoneyInAdvanceTransfer', 'error')} required">
				<label for="dateOfMoneyInAdvanceTransfer" class="control-label"><g:message code="wish.dateOfMoneyInAdvanceTransfer.label" default="Date Of Money In Advance Transfer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="dateOfMoneyInAdvanceTransfer" precision="day"  value="${wishInstance?.dateOfMoneyInAdvanceTransfer}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dateOfMoneyInAdvanceTransfer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'deliveryDate', 'error')} required">
				<label for="deliveryDate" class="control-label"><g:message code="wish.deliveryDate.label" default="Delivery Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="deliveryDate" precision="day"  value="${wishInstance?.deliveryDate}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'deliveryDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dispatchNumber', 'error')} required">
				<label for="dispatchNumber" class="control-label"><g:message code="wish.dispatchNumber.label" default="Dispatch Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="dispatchNumber" required="" value="${wishInstance.dispatchNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dispatchNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiNumber', 'error')} required">
				<label for="djaiNumber" class="control-label"><g:message code="wish.djaiNumber.label" default="Djai Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="djaiNumber" required="" value="${wishInstance.djaiNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftApproved', 'error')} ">
				<label for="docDraftApproved" class="control-label"><g:message code="wish.docDraftApproved.label" default="Doc Draft Approved" /></label>
				<div class="controls">
					<bs:checkBox name="docDraftApproved" value="${wishInstance?.docDraftApproved}" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'docDraftApproved', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')} ">
				<label for="docDraftToBeApprovedBeforeDelivery" class="control-label"><g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery" /></label>
				<div class="controls">
					<g:select name="docDraftToBeApprovedBeforeDelivery" from="${wish.Draft.list()}" multiple="multiple" optionKey="id" size="5" value="${wishInstance?.docDraftToBeApprovedBeforeDelivery*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'estimatedDeliveryTerm', 'error')} required">
				<label for="estimatedDeliveryTerm" class="control-label"><g:message code="wish.estimatedDeliveryTerm.label" default="Estimated Delivery Term" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="estimatedDeliveryTerm" required="" value="${wishInstance.estimatedDeliveryTerm}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'estimatedDeliveryTerm', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'estimatedTimeOfArrival', 'error')} required">
				<label for="estimatedTimeOfArrival" class="control-label"><g:message code="wish.estimatedTimeOfArrival.label" default="Estimated Time Of Arrival" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="estimatedTimeOfArrival" precision="day"  value="${wishInstance?.estimatedTimeOfArrival}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'estimatedTimeOfArrival', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'estimatedTimeOfDeparture', 'error')} required">
				<label for="estimatedTimeOfDeparture" class="control-label"><g:message code="wish.estimatedTimeOfDeparture.label" default="Estimated Time Of Departure" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="estimatedTimeOfDeparture" precision="day"  value="${wishInstance?.estimatedTimeOfDeparture}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'estimatedTimeOfDeparture', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'extendedDjai', 'error')} required">
				<label for="extendedDjai" class="control-label"><g:message code="wish.extendedDjai.label" default="Extended Djai" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="extendedDjai" precision="day"  value="${wishInstance?.extendedDjai}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'extendedDjai', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'firstStageRequiredDocuments', 'error')} ">
				<label for="firstStageRequiredDocuments" class="control-label"><g:message code="wish.firstStageRequiredDocuments.label" default="First Stage Required Documents" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${wishInstance?.firstStageRequiredDocuments?}" var="f">
    <li><g:link controller="document" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="document" action="create" params="['wish.id': wishInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'document.label', default: 'Document')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'firstStageRequiredDocuments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'formalizationDate', 'error')} required">
				<label for="formalizationDate" class="control-label"><g:message code="wish.formalizationDate.label" default="Formalization Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="formalizationDate" precision="day"  value="${wishInstance?.formalizationDate}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'formalizationDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'forwarder', 'error')} required">
				<label for="forwarder" class="control-label"><g:message code="wish.forwarder.label" default="Forwarder" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="forwarder" name="forwarder.id" from="${stakeholder.Forwarder.list()}" optionKey="id" required="" value="${wishInstance?.forwarder?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'forwarder', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'forwarderRefNumber', 'error')} ">
				<label for="forwarderRefNumber" class="control-label"><g:message code="wish.forwarderRefNumber.label" default="Forwarder Ref Number" /></label>
				<div class="controls">
					<g:textField name="forwarderRefNumber" value="${wishInstance?.forwarderRefNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'forwarderRefNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'freightQuote', 'error')} required">
				<label for="freightQuote" class="control-label"><g:message code="wish.freightQuote.label" default="Freight Quote" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="freightQuote" step="any" required="" value="${wishInstance.freightQuote}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'freightQuote', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'grossWeight', 'error')} required">
				<label for="grossWeight" class="control-label"><g:message code="wish.grossWeight.label" default="Gross Weight" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="grossWeight" step="any" required="" value="${wishInstance.grossWeight}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'grossWeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'hsCodeToBeWritten', 'error')} ">
				<label for="hsCodeToBeWritten" class="control-label"><g:message code="wish.hsCodeToBeWritten.label" default="Hs Code To Be Written" /></label>
				<div class="controls">
					<g:textField name="hsCodeToBeWritten" value="${wishInstance?.hsCodeToBeWritten}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'hsCodeToBeWritten', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'licenses', 'error')} ">
				<label for="licenses" class="control-label"><g:message code="wish.licenses.label" default="Licenses" /></label>
				<div class="controls">
					<bs:checkBox name="licenses" value="${wishInstance?.licenses}" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'licenses', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'load', 'error')} required">
				<label for="load" class="control-label"><g:message code="wish.load.label" default="Load" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="load" name="load.id" from="${wish.Load.list()}" optionKey="id" required="" value="${wishInstance?.load?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'load', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'loadSecuredPercent', 'error')} required">
				<label for="loadSecuredPercent" class="control-label"><g:message code="wish.loadSecuredPercent.label" default="Load Secured Percent" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="loadSecuredPercent" step="any" required="" value="${wishInstance.loadSecuredPercent}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'loadSecuredPercent', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'moneyBalance', 'error')} required">
				<label for="moneyBalance" class="control-label"><g:message code="wish.moneyBalance.label" default="Money Balance" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="moneyBalance" step="any" required="" value="${wishInstance.moneyBalance}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'moneyBalance', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'netWeight', 'error')} required">
				<label for="netWeight" class="control-label"><g:message code="wish.netWeight.label" default="Net Weight" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="netWeight" step="any" required="" value="${wishInstance.netWeight}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'netWeight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'note', 'error')} ">
				<label for="note" class="control-label"><g:message code="wish.note.label" default="Note" /></label>
				<div class="controls">
					<g:textField name="note" value="${wishInstance?.note}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'note', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'opNumber', 'error')} required">
				<label for="opNumber" class="control-label"><g:message code="wish.opNumber.label" default="Op Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="opNumber" required="" value="${wishInstance.opNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'opNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'palletsQuantity', 'error')} required">
				<label for="palletsQuantity" class="control-label"><g:message code="wish.palletsQuantity.label" default="Pallets Quantity" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="palletsQuantity" required="" value="${wishInstance.palletsQuantity}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'palletsQuantity', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'paymentStatus', 'error')} required">
				<label for="paymentStatus" class="control-label"><g:message code="wish.paymentStatus.label" default="Payment Status" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="paymentStatus" name="paymentStatus.id" from="${wish.PaymentStatus.list()}" optionKey="id" required="" value="${wishInstance?.paymentStatus?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'paymentStatus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'paymentTerm', 'error')} required">
				<label for="paymentTerm" class="control-label"><g:message code="wish.paymentTerm.label" default="Payment Term" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="paymentTerm" name="paymentTerm.id" from="${wish.PaymentTerm.list()}" optionKey="id" required="" value="${wishInstance?.paymentTerm?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'paymentTerm', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainer', 'error')} ">
				<label for="picturesOfLoadingContainer" class="control-label"><g:message code="wish.picturesOfLoadingContainer.label" default="Pictures Of Loading Container" /></label>
				<div class="controls">
					<g:select name="picturesOfLoadingContainer" from="${wish.Picture.list()}" multiple="multiple" optionKey="id" size="5" value="${wishInstance?.picturesOfLoadingContainer*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainerReveived', 'error')} ">
				<label for="picturesOfLoadingContainerReveived" class="control-label"><g:message code="wish.picturesOfLoadingContainerReveived.label" default="Pictures Of Loading Container Reveived" /></label>
				<div class="controls">
					<bs:checkBox name="picturesOfLoadingContainerReveived" value="${wishInstance?.picturesOfLoadingContainerReveived}" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainerReveived', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxes', 'error')} ">
				<label for="picturesOfPrintingBoxes" class="control-label"><g:message code="wish.picturesOfPrintingBoxes.label" default="Pictures Of Printing Boxes" /></label>
				<div class="controls">
					<g:select name="picturesOfPrintingBoxes" from="${wish.Picture.list()}" multiple="multiple" optionKey="id" size="5" value="${wishInstance?.picturesOfPrintingBoxes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxes', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesAndLoadReceived', 'error')} ">
				<label for="picturesOfPrintingBoxesAndLoadReceived" class="control-label"><g:message code="wish.picturesOfPrintingBoxesAndLoadReceived.label" default="Pictures Of Printing Boxes And Load Received" /></label>
				<div class="controls">
					<bs:checkBox name="picturesOfPrintingBoxesAndLoadReceived" value="${wishInstance?.picturesOfPrintingBoxesAndLoadReceived}" />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesAndLoadReceived', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'port', 'error')} required">
				<label for="port" class="control-label"><g:message code="wish.port.label" default="Port" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="port" name="port.id" from="${modal.Port.list()}" optionKey="id" required="" value="${wishInstance?.port?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'port', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'priceCondition', 'error')} required">
				<label for="priceCondition" class="control-label"><g:message code="wish.priceCondition.label" default="Price Condition" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="priceCondition" name="priceCondition.id" from="${wish.PriceCondition.list()}" optionKey="id" required="" value="${wishInstance?.priceCondition?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'priceCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'secondStageRequiredDocuments', 'error')} ">
				<label for="secondStageRequiredDocuments" class="control-label"><g:message code="wish.secondStageRequiredDocuments.label" default="Second Stage Required Documents" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${wishInstance?.secondStageRequiredDocuments?}" var="s">
    <li><g:link controller="document" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="document" action="create" params="['wish.id': wishInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'document.label', default: 'Document')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'secondStageRequiredDocuments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'ship', 'error')} required">
				<label for="ship" class="control-label"><g:message code="wish.ship.label" default="Ship" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ship" name="ship.id" from="${modal.Ship.list()}" optionKey="id" required="" value="${wishInstance?.ship?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'ship', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shipper', 'error')} required">
				<label for="shipper" class="control-label"><g:message code="wish.shipper.label" default="Shipper" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="shipper" name="shipper.id" from="${stakeholder.Shipper.list()}" optionKey="id" required="" value="${wishInstance?.shipper?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shipper', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shippingMark', 'error')} required">
				<label for="shippingMark" class="control-label"><g:message code="wish.shippingMark.label" default="Shipping Mark" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="shippingMark" name="shippingMark.id" from="${modal.ShippingMark.list()}" optionKey="id" required="" value="${wishInstance?.shippingMark?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shippingMark', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'sourceCountry', 'error')} required">
				<label for="sourceCountry" class="control-label"><g:message code="wish.sourceCountry.label" default="Source Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sourceCountry" name="sourceCountry.id" from="${modal.Country.list()}" optionKey="id" required="" value="${wishInstance?.sourceCountry?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'sourceCountry', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'supplier', 'error')} required">
				<label for="supplier" class="control-label"><g:message code="wish.supplier.label" default="Supplier" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="supplier" name="supplier.id" from="${stakeholder.Supplier.list()}" optionKey="id" required="" value="${wishInstance?.supplier?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'supplier', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'supplierOrder', 'error')} ">
				<label for="supplierOrder" class="control-label"><g:message code="wish.supplierOrder.label" default="Supplier Order" /></label>
				<div class="controls">
					<g:textField name="supplierOrder" value="${wishInstance?.supplierOrder}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'supplierOrder', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'swiftSentToSupplierDate', 'error')} required">
				<label for="swiftSentToSupplierDate" class="control-label"><g:message code="wish.swiftSentToSupplierDate.label" default="Swift Sent To Supplier Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="swiftSentToSupplierDate" precision="day"  value="${wishInstance?.swiftSentToSupplierDate}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'swiftSentToSupplierDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'timeOfArrival', 'error')} required">
				<label for="timeOfArrival" class="control-label"><g:message code="wish.timeOfArrival.label" default="Time Of Arrival" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="timeOfArrival" precision="day"  value="${wishInstance?.timeOfArrival}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'timeOfArrival', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'timeOfDeparture', 'error')} required">
				<label for="timeOfDeparture" class="control-label"><g:message code="wish.timeOfDeparture.label" default="Time Of Departure" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="timeOfDeparture" precision="day"  value="${wishInstance?.timeOfDeparture}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'timeOfDeparture', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'typeOfFreight', 'error')} required">
				<label for="typeOfFreight" class="control-label"><g:message code="wish.typeOfFreight.label" default="Type Of Freight" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="typeOfFreight" name="typeOfFreight.id" from="${modal.TypeOfFreight.list()}" optionKey="id" required="" value="${wishInstance?.typeOfFreight?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'typeOfFreight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'visaChargePayment', 'error')} required">
				<label for="visaChargePayment" class="control-label"><g:message code="wish.visaChargePayment.label" default="Visa Charge Payment" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="visaChargePayment" step="any" required="" value="${wishInstance.visaChargePayment}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'visaChargePayment', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'visaChargePaymentConcept', 'error')} required">
				<label for="visaChargePaymentConcept" class="control-label"><g:message code="wish.visaChargePaymentConcept.label" default="Visa Charge Payment Concept" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="visaChargePaymentConcept" name="visaChargePaymentConcept.id" from="${wish.VisaChargePaymentConcept.list()}" optionKey="id" required="" value="${wishInstance?.visaChargePaymentConcept?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'visaChargePaymentConcept', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'wishDate', 'error')} required">
				<label for="wishDate" class="control-label"><g:message code="wish.wishDate.label" default="Wish Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="wishDate" precision="day"  value="${wishInstance?.wishDate}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'wishDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'wishStatus', 'error')} required">
				<label for="wishStatus" class="control-label"><g:message code="wish.wishStatus.label" default="Wish Status" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="wishStatus" name="wishStatus.id" from="${wish.WishStatus.list()}" optionKey="id" required="" value="${wishInstance?.wishStatus?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'wishStatus', 'error')}</span>
				</div>
			</div>

