<%@ page import="wish.Wish" %>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customer', 'error')} required">
				<label for="customer" class="control-label"><g:message code="wish.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customer" name="customer.id" from="${stakeholder.StakeholderRole.findByName(stakeholder.StakeholderRole.customerLabel)?.stakeholders}" optionKey="id" required="" value="${wishInstance?.customer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'supplier', 'error')} required">
				<label for="supplier" class="control-label"><g:message code="wish.supplier.label" default="Supplier" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="supplier" name="supplier.id" from="${stakeholder.StakeholderRole.findByName(stakeholder.StakeholderRole.supplierLabel)?.stakeholders}" optionKey="id" required="" value="${wishInstance?.supplier?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'supplier', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shipper', 'error')} required">
				<label for="shipper" class="control-label"><g:message code="wish.shipper.label" default="Shipper" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="shipper" name="shipper.id" from="${stakeholder.StakeholderRole.findByName(stakeholder.StakeholderRole.shipperLabel)?.stakeholders}" optionKey="id" required="" value="${wishInstance?.shipper?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shipper', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'afipRequirement', 'error')} ">
				<label for="afipRequirement" class="control-label"><g:message code="wish.afipRequirement.label" default="Afip Requirement" /></label>
				<div class="controls">
					<g:textField name="afipRequirement" value="${wishInstance?.afipRequirement}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'afipRequirement', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'agent', 'error')} required">
				<label for="agent" class="control-label"><g:message code="wish.agent.label" default="Agent" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="agent" name="agent.id" from="${stakeholder.StakeholderRole.findByName(stakeholder.StakeholderRole.agentLabel)?.stakeholders}" optionKey="id" required="" value="${wishInstance?.agent?.id}" class="many-to-one"/>
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

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'artDescription', 'error')} ">
				<label for="artDescription" class="control-label"><g:message code="wish.artDescription.label" default="Art Description" /></label>
				<div class="controls">
					<g:textField name="artDescription" value="${wishInstance?.artDescription}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'artDescription', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'bill', 'error')} required">
				<label for="bill" class="control-label"><g:message code="wish.bill.label" default="Bill" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="bill" required="" value="${wishInstance.bill}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'bill', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'blNumber', 'error')} ">
				<label for="blNumber" class="control-label"><g:message code="wish.blNumber.label" default="Bl Number" /></label>
				<div class="controls">
					<g:textField name="blNumber" value="${wishInstance?.blNumber}"/>
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
					<g:textField name="ciTaxAndCuitVerification" value="${wishInstance?.ciTaxAndCuitVerification}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'ciTaxAndCuitVerification', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'conversion', 'error')} required">
				<label for="conversion" class="control-label"><g:message code="wish.conversion.label" default="Conversion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="conversion" step="any" required="" value="${wishInstance.conversion}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'conversion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'criterionValue', 'error')} ">
				<label for="criterionValue" class="control-label"><g:message code="wish.criterionValue.label" default="Criterion Value" /></label>
				<div class="controls">
					<g:textField name="criterionValue" value="${wishInstance?.criterionValue}"/>
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

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customerLogoPunch', 'error')} ">
				<label for="customerLogoPunch" class="control-label"><g:message code="wish.customerLogoPunch.label" default="Customer Logo Punch" /></label>
				<div class="controls">
					<g:textField name="customerLogoPunch" value="${wishInstance?.customerLogoPunch}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customerLogoPunch', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customsBroker', 'error')} required">
				<label for="customsBroker" class="control-label"><g:message code="wish.customsBroker.label" default="Customs Broker" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customsBroker" name="customsBroker.id" from="${stakeholder.StakeholderRole.findByName(stakeholder.StakeholderRole.customsBrokerLabel)?.stakeholders}" optionKey="id" required="" value="${wishInstance?.customsBroker?.id}" class="many-to-one"/>
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

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dispatchNumber', 'error')} ">
				<label for="dispatchNumber" class="control-label"><g:message code="wish.dispatchNumber.label" default="Dispatch Number" /></label>
				<div class="controls">
					<g:textField name="dispatchNumber" value="${wishInstance?.dispatchNumber}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dispatchNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiPresented', 'error')} ">
				<label for="djaiPresented" class="control-label"><g:message code="wish.djaiPresented.label" default="Djai Presented" /></label>
				<div class="controls">
					<g:textField name="djaiPresented" value="${wishInstance?.djaiPresented}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiPresented', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiStatus', 'error')} ">
				<label for="djaiStatus" class="control-label"><g:message code="wish.djaiStatus.label" default="Djai Status" /></label>
				<div class="controls">
					<g:textField name="djaiStatus" value="${wishInstance?.djaiStatus}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiStatus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')} ">
				<label for="docDraftToBeApprovedBeforeDelivery" class="control-label"><g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery" /></label>
				<div class="controls">
					<g:textField name="docDraftToBeApprovedBeforeDelivery" value="${wishInstance?.docDraftToBeApprovedBeforeDelivery}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'documentatioStatus', 'error')} ">
				<label for="documentatioStatus" class="control-label"><g:message code="wish.documentatioStatus.label" default="Documentatio Status" /></label>
				<div class="controls">
					<g:textField name="documentatioStatus" value="${wishInstance?.documentatioStatus}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'documentatioStatus', 'error')}</span>
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

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'forwarder', 'error')} required">
				<label for="forwarder" class="control-label"><g:message code="wish.forwarder.label" default="Forwarder" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="forwarder" name="forwarder.id" from="${stakeholder.StakeholderRole.findByName(stakeholder.StakeholderRole.forwarderLabel)?.stakeholders}" optionKey="id" required="" value="${wishInstance?.forwarder?.id}" class="many-to-one"/>
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

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'hsCodeToBeWritter', 'error')} ">
				<label for="hsCodeToBeWritter" class="control-label"><g:message code="wish.hsCodeToBeWritter.label" default="Hs Code To Be Writter" /></label>
				<div class="controls">
					<g:textField name="hsCodeToBeWritter" value="${wishInstance?.hsCodeToBeWritter}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'hsCodeToBeWritter', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'licenses', 'error')} ">
				<label for="licenses" class="control-label"><g:message code="wish.licenses.label" default="Licenses" /></label>
				<div class="controls">
					<g:textField name="licenses" value="${wishInstance?.licenses}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'licenses', 'error')}</span>
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
					<g:textField name="picturesOfLoadingContainer" value="${wishInstance?.picturesOfLoadingContainer}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesAndLoad', 'error')} ">
				<label for="picturesOfPrintingBoxesAndLoad" class="control-label"><g:message code="wish.picturesOfPrintingBoxesAndLoad.label" default="Pictures Of Printing Boxes And Load" /></label>
				<div class="controls">
					<g:textField name="picturesOfPrintingBoxesAndLoad" value="${wishInstance?.picturesOfPrintingBoxesAndLoad}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesAndLoad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'port', 'error')} required">
				<label for="port" class="control-label"><g:message code="wish.port.label" default="Port" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="port" name="port.id" from="${modal.Port.list()}" optionKey="id" required="" value="${wishInstance?.port?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'port', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'previousDocumentationCopy', 'error')} ">
				<label for="previousDocumentationCopy" class="control-label"><g:message code="wish.previousDocumentationCopy.label" default="Previous Documentation Copy" /></label>
				<div class="controls">
					<g:textField name="previousDocumentationCopy" value="${wishInstance?.previousDocumentationCopy}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'previousDocumentationCopy', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'priceCondition', 'error')} required">
				<label for="priceCondition" class="control-label"><g:message code="wish.priceCondition.label" default="Price Condition" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="priceCondition" name="priceCondition.id" from="${wish.PriceCondition.list()}" optionKey="id" required="" value="${wishInstance?.priceCondition?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'priceCondition', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'requiredDocuments', 'error')} ">
				<label for="requiredDocuments" class="control-label"><g:message code="wish.requiredDocuments.label" default="Required Documents" /></label>
				<div class="controls">
					<g:textField name="requiredDocuments" value="${wishInstance?.requiredDocuments}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'requiredDocuments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shipName', 'error')} ">
				<label for="shipName" class="control-label"><g:message code="wish.shipName.label" default="Ship Name" /></label>
				<div class="controls">
					<g:textField name="shipName" value="${wishInstance?.shipName}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shipName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shippingMarks', 'error')} ">
				<label for="shippingMarks" class="control-label"><g:message code="wish.shippingMarks.label" default="Shipping Marks" /></label>
				<div class="controls">
					<g:textField name="shippingMarks" value="${wishInstance?.shippingMarks}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shippingMarks', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'sourceCountry', 'error')} required">
				<label for="sourceCountry" class="control-label"><g:message code="wish.sourceCountry.label" default="Source Country" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sourceCountry" name="sourceCountry.id" from="${modal.Country.list()}" optionKey="id" required="" value="${wishInstance?.sourceCountry?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'sourceCountry', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'supplierOrder', 'error')} ">
				<label for="supplierOrder" class="control-label"><g:message code="wish.supplierOrder.label" default="Supplier Order" /></label>
				<div class="controls">
					<g:textField name="supplierOrder" value="${wishInstance?.supplierOrder}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'supplierOrder', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'swiftSentToSupplier', 'error')} required">
				<label for="swiftSentToSupplier" class="control-label"><g:message code="wish.swiftSentToSupplier.label" default="Swift Sent To Supplier" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="swiftSentToSupplier" precision="day"  value="${wishInstance?.swiftSentToSupplier}"  />
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'swiftSentToSupplier', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'totalFob', 'error')} required">
				<label for="totalFob" class="control-label"><g:message code="wish.totalFob.label" default="Total Fob" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="totalFob" step="any" required="" value="${wishInstance.totalFob}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'totalFob', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'typeOfFreight', 'error')} ">
				<label for="typeOfFreight" class="control-label"><g:message code="wish.typeOfFreight.label" default="Type Of Freight" /></label>
				<div class="controls">
					<g:textField name="typeOfFreight" value="${wishInstance?.typeOfFreight}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'typeOfFreight', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'visaChargePayment', 'error')} ">
				<label for="visaChargePayment" class="control-label"><g:message code="wish.visaChargePayment.label" default="Visa Charge Payment" /></label>
				<div class="controls">
					<g:textField name="visaChargePayment" value="${wishInstance?.visaChargePayment}"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'visaChargePayment', 'error')}</span>
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

