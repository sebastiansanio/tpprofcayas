<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>


<div id="generalDataInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseData">
			<g:message code="wish.title.generalData.label" default="General Data"/>
		</a>
		</h4>
	</div>
	<div id="collapseData" class="accordion-body collapse in">
    	<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customer', 'error')} required">
						<label for="customer" class="control-label"><g:message code="wish.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
						<div class="controls">
							<g:select onChange="getCustomerOpNumber(this);" noSelection="['null': '']" id="customer" name="customer.id" from="${stakeholder.Customer.list(sort:'name')}" optionKey="id" required="" value="${wishInstance?.customer?.id}" class="many-to-one"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customer', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'supplier', 'error')} required">
						<label for="supplier" class="control-label"><g:message code="wish.supplier.label" default="Supplier" /><span class="required-indicator">*</span></label>
						<div class="controls">
							<g:select noSelection="['null': '']" id="supplier" name="supplier.id" from="${stakeholder.Supplier.list(sort:'name')}" optionKey="id" required="" value="${wishInstance?.supplier?.id}" class="many-to-one"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'supplier', 'error')}</span>
						</div>
					</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shipper', 'error')} ">
						<label for="shipper" class="control-label"><g:message code="wish.shipper.label" default="Shipper" /></label>
						<div class="controls">
							<g:select noSelection="['null': '']" id="shipper" name="shipper.id" from="${stakeholder.Shipper.list(sort:'name')}" optionKey="id" required="" value="${wishInstance?.shipper?.id}" class="many-to-one"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shipper', 'error')}</span>
						</div>
					</div>
							
				</div>
				
				<div class="span6">
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customsBroker', 'error')} ">
						<label for="customsBroker" class="control-label"><g:message code="wish.customsBroker.label" default="Customs Broker" /></label>
						<div class="controls">
							<g:select id="customsBroker" name="customsBroker.id" from="${stakeholder.CustomsBroker.list(sort:'name')}" optionKey="id" value="${wishInstance?.customsBroker?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customsBroker', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'forwarder', 'error')} ">
						<label for="forwarder" class="control-label"><g:message code="wish.forwarder.label" default="Forwarder" /></label>
						<div class="controls">
							<g:select id="forwarder" name="forwarder.id" from="${stakeholder.Forwarder.list(sort:'name')}" optionKey="id" value="${wishInstance?.forwarder?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'forwarder', 'error')}</span>
						</div>
					</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'agent', 'error')} ">
						<label for="agent" class="control-label"><g:message code="wish.agent.label" default="Agent" /></label>
						<div class="controls">
							<g:select id="agent" name="agent.id" from="${stakeholder.Agent.list(sort:'name')}" optionKey="id" value="${wishInstance?.agent?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'agent', 'error')}</span>
						</div>
					</div>
				
				</div>
				
			</div>		
     	</div>
	</div>
</div>

<div id="wishStatus" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseWishStatus">
			<g:message code="wish.title.wishStatus.label" default="Wish status"/>
		</a>
		</h4>
	</div>
	<div id="collapseWishStatus" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'wishStatus', 'error')} ">
						<label for="wishStatus" class="control-label"><g:message code="wish.wishStatus.label" default="Wish Status" /></label>
						<div class="controls">
							<g:select id="wishStatus" name="wishStatus.id" from="${modal.WishStatus.list()}" optionKey="id" value="${wishInstance?.wishStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'wishStatus', 'error')}</span>
						</div>
					</div>				
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="referenceInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseReference">
			<g:message code="wish.title.reference.label" default="Reference"/>
		</a>
		</h4>
	</div>
	<div id="collapseReference" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
										
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'opNumber', 'error')}">
						<label for="opNumber" class="control-label"><g:message code="wish.opNumber.label" default="Op Number" /></label>
						<div class="controls">
							<g:field type="number" name="opNumber" min="0" value="${wishInstance.opNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'opNumber', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customerOpNumber', 'error')}">
						<label for="customerOpNumber" class="control-label"><g:message code="wish.customerOpNumber.label" default="Customer Op Number" /></label>
						<div class="controls">
							<g:field type="number" id="customerOpNumber" name="customerOpNumber" min="0" value="${wishInstance.customerOpNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customerOpNumber', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'supplierOrder', 'error')} ">
						<label for="supplierOrder" class="control-label"><g:message code="wish.supplierOrder.label" default="Supplier Order" /></label>
						<div class="controls">
							<g:textField name="supplierOrder" value="${wishInstance?.supplierOrder}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'supplierOrder', 'error')}</span>
						</div>
					</div>
					
				</div>
				
				<div class="span6">
				
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customsBrokerRefNumber', 'error')} ">
						<label for="customsBrokerRefNumber" class="control-label"><g:message code="wish.customsBrokerRefNumber.label" default="Customs Broker Ref Number" /></label>
						<div class="controls">
							<g:textField name="customsBrokerRefNumber" value="${wishInstance?.customsBrokerRefNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customsBrokerRefNumber', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'forwarderRefNumber', 'error')} ">
						<label for="forwarderRefNumber" class="control-label"><g:message code="wish.forwarderRefNumber.label" default="Forwarder Ref Number" /></label>
						<div class="controls">
							<g:textField name="forwarderRefNumber" value="${wishInstance?.forwarderRefNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'forwarderRefNumber', 'error')}</span>
						</div>
					</div>
								
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="datesInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseDates">
			<g:message code="wish.title.dates.label" default="Dates"/>
		</a>
		</h4>
	</div>
	<div id="collapseDates" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'wishDate', 'error')} required">
						<label for="wishDate" class="control-label"><g:message code="wish.wishDate.label" default="Wish Date" /><span class="required-indicator">*</span></label>
						<div class="controls">
							<bs:datePicker name="wishDate" precision="day"  value="${wishInstance?.wishDate}"  />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'wishDate', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'cartonPrintingInfoSentDate', 'error')} ">
						<label for="cartonPrintingInfoSentDate" class="control-label"><g:message code="wish.cartonPrintingInfoSentDate.label" default="Carton Printing Info Send Date" /></label>
						<div class="controls">
							<bs:datePicker name="cartonPrintingInfoSentDate" precision="day"  value="${wishInstance?.cartonPrintingInfoSentDate}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'cartonPrintingInfoSentDate', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'deliveryDate', 'error')} ">
						<label for="deliveryDate" class="control-label"><g:message code="wish.deliveryDate.label" default="Delivery Date" /></label>
						<div class="controls">
							<bs:datePicker name="deliveryDate" precision="day"  value="${wishInstance?.deliveryDate}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'deliveryDate', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'deliveryDateConfirmed', 'error')} ">
						<label for="deliveryDateConfirmed" class="control-label"><g:message code="wish.deliveryDateConfirmed.label" default="Delivery Date Confirmed?" /></label>
						<div class="controls">
							<bs:checkBox name="deliveryDateConfirmed" value="${wishInstance?.deliveryDateConfirmed}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'deliveryDateConfirmed', 'error')}</span>
						</div>
					</div>

										
				</div>
				<div class="span6">


					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'estimatedTimeOfDeparture', 'error')} ">
						<label for="estimatedTimeOfDeparture" class="control-label"><g:message code="wish.estimatedTimeOfDeparture.label" default="Estimated Time Of Departure" /></label>
						<div class="controls">
							<bs:datePicker name="estimatedTimeOfDeparture" precision="day"  value="${wishInstance?.estimatedTimeOfDeparture}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'estimatedTimeOfDeparture', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'departed', 'error')} ">
						<label for="departed" class="control-label"><g:message code="wish.departed.label" default="Departed" /></label>
						<div class="controls">
							<bs:checkBox name="departed" value="${wishInstance?.departed}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'departed', 'error')}</span>
						</div>
					</div>
					


					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'estimatedTimeOfArrival', 'error')} ">
						<label for="estimatedTimeOfArrival" class="control-label"><g:message code="wish.estimatedTimeOfArrival.label" default="Estimated Time Of Arrival" /></label>
						<div class="controls">
							<bs:datePicker name="estimatedTimeOfArrival" precision="day"  value="${wishInstance?.estimatedTimeOfArrival}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'estimatedTimeOfArrival', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'arrived', 'error')} ">
						<label for="arrived" class="control-label"><g:message code="wish.arrived.label" default="Arrived" /></label>
						<div class="controls">
							<bs:checkBox name="arrived" value="${wishInstance?.arrived}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'arrived', 'error')}</span>
						</div>
					</div>

					
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="paymentInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapsePayment">
			<g:message code="wish.title.payment.label" default="Payment"/>
		</a>
		</h4>
	</div>
	<div id="collapsePayment" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
				
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'priceCondition', 'error')} ">
						<label for="priceCondition" class="control-label"><g:message code="wish.priceCondition.label" default="Price Condition" /></label>
						<div class="controls">
							<g:select id="priceCondition" name="priceCondition.id" from="${modal.PriceCondition.list()}" optionKey="id" value="${wishInstance?.priceCondition?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'priceCondition', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'currency', 'error')} ">
						<label for="currency" class="control-label"><g:message code="wish.currency.label" default="Currency" /></label>
						<div class="controls">
							<g:select id="currency" name="currency.id" from="${modal.Currency.list()}" optionKey="id" value="${wishInstance?.currency?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'currency', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'conversion', 'error')} ">
						<label for="conversion" class="control-label"><g:message code="wish.conversion.label" default="Conversion" /></label>
						<div class="controls">
							<g:field type="number" name="conversion" step="any" value="${wishInstance.conversion}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'conversion', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'currencyFob', 'error')} ">
						<label for="currencyFob" class="control-label"><g:message code="wish.currencyFob.label" default="Currency Fob" /></label>
						<div class="controls">
							<g:field id="currencyFob" onChange="calculateBalance();" type="number" name="currencyFob" step="any" value="${wishInstance.currencyFob}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'currencyFob', 'error')}</span>
						</div>
					</div>
								
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'paymentStatus', 'error')} ">
						<label for="paymentStatus" class="control-label"><g:message code="wish.paymentStatus.label" default="Payment Status" /></label>
						<div class="controls">
							<g:select id="paymentStatus" name="paymentStatus.id" from="${modal.PaymentStatus.list()}" optionKey="id" value="${wishInstance?.paymentStatus?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'paymentStatus', 'error')}</span>
						</div>
					</div>	
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'paymentTerm', 'error')} ">
						<label for="paymentTerm" class="control-label"><g:message code="wish.paymentTerm.label" default="Payment Term" /></label>
						<div class="controls">
							<g:select id="paymentTerm" name="paymentTerm.id" from="${modal.PaymentTerm.list()}" optionKey="id" value="${wishInstance?.paymentTerm?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'paymentTerm', 'error')}</span>
						</div>
					</div>
					
							
				</div>
				<div class="span6">
						
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dateOfMoneyInAdvanceTransfer', 'error')} ">
						<label for="dateOfMoneyInAdvanceTransfer" class="control-label"><g:message code="wish.dateOfMoneyInAdvanceTransfer.label" default="Date Of Money In Advance Transfer" /></label>
						<div class="controls">
							<bs:datePicker name="dateOfMoneyInAdvanceTransfer" precision="day"  value="${wishInstance?.dateOfMoneyInAdvanceTransfer}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dateOfMoneyInAdvanceTransfer', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'amountOfMoneyInAdvanceTransferred', 'error')} ">
						<label for="amountOfMoneyInAdvanceTransferred" class="control-label"><g:message code="wish.amountOfMoneyInAdvanceTransferred.label" default="Amount Of Money In Advance Transferred" /></label>
						<div class="controls">
							<g:field id="amountOfMoneyInAdvanceTransferred" onChange="calculateBalance();" type="number" name="amountOfMoneyInAdvanceTransferred" step="any" value="${wishInstance.amountOfMoneyInAdvanceTransferred}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'amountOfMoneyInAdvanceTransferred', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'moneyBalance', 'error')} ">
						<label for="moneyBalance" class="control-label"><g:message code="wish.moneyBalance.label" default="Money Balance" /></label>
						<div class="controls">
							<g:field id="moneyBalance" type="number" name="moneyBalance" step="any" value="${wishInstance.moneyBalance}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'moneyBalance', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dateOfBalancePayment', 'error')} ">
						<label for="dateOfBalancePayment" class="control-label"><g:message code="wish.dateOfBalancePayment.label" default="Date Of Balance Payment" /></label>
						<div class="controls">
							<bs:datePicker name="dateOfBalancePayment" precision="day"  value="${wishInstance?.dateOfBalancePayment}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dateOfBalancePayment', 'error')}</span>
						</div>
					</div>			
						
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="loadInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseLoad">
			<g:message code="wish.title.load.label" default="Products"/>
		</a>
		</h4>
	</div>
	<div id="collapseLoad" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
				
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'productDescription', 'error')} ">
						<label for="productDescription" class="control-label"><g:message code="wish.productDescription.label" default="Product Description" /></label>
						<div class="controls">
							<g:textArea rows="5" cols="70" name="productDescription" value="${wishInstance?.productDescription}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'productDescription', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'shippingMark', 'error')} ">
						<label for="shippingMark" class="control-label"><g:message code="wish.shippingMark.label" default="Shipping Mark" /></label>
						<div class="controls">
							<g:select id="shippingMark" name="shippingMark.id" from="${modal.ShippingMark.list()}" optionKey="id" value="${wishInstance?.shippingMark?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'shippingMark', 'error')}</span>
						</div>
					</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'customerLogoPunch', 'error')} ">
						<label for="customerLogoPunch" class="control-label"><g:message code="wish.customerLogoPunch.label" default="Customer Logo Punch" /></label>
						<div class="controls">
							<bs:checkBox name="customerLogoPunch" value="${wishInstance?.customerLogoPunch}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'customerLogoPunch', 'error')}</span>
						</div>
					</div>
					
				</div>
				<div class="span6">
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'cbm', 'error')} ">
						<label for="cbm" class="control-label"><g:message code="wish.cbm.label" default="Cbm" /></label>
						<div class="controls">
							<g:field type="number" name="cbm" step="any" value="${wishInstance.cbm}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'cbm', 'error')}</span>
						</div>
					</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'grossWeight', 'error')} ">
						<label for="grossWeight" class="control-label"><g:message code="wish.grossWeight.label" default="Gross Weight" /></label>
						<div class="controls">
							<g:field type="number" name="grossWeight" step="any" value="${wishInstance.grossWeight}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'grossWeight', 'error')}</span>
						</div>
					</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'netWeight', 'error')} ">
						<label for="netWeight" class="control-label"><g:message code="wish.netWeight.label" default="Net Weight" /></label>
						<div class="controls">
							<g:field type="number" name="netWeight" step="any" value="${wishInstance.netWeight}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'netWeight', 'error')}</span>
						</div>
					</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'palletsQuantity', 'error')} ">
						<label for="palletsQuantity" class="control-label"><g:message code="wish.palletsQuantity.label" default="Pallets Quantity" /></label>
						<div class="controls">
							<g:field type="number" name="palletsQuantity" value="${wishInstance.palletsQuantity}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'palletsQuantity', 'error')}</span>
						</div>
					</div>

				<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'palletsMaterial', 'error')} ">
				<label for="palletsMaterial" class="control-label"><g:message code="wish.palletsMaterial.label"  /></label>
				<div class="controls">
					<g:select name="palletsMaterial" from="${wishInstance.constraints.palletsMaterial.inList}" value="${wishInstance?.palletsMaterial}" valueMessagePrefix="wish.palletsMaterial" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: wishInstance, field: 'palletsMaterial', 'error')}</span>
				</div>
			</div>
		
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'typeOfFreight', 'error')} ">
						<label for="typeOfFreight" class="control-label"><g:message code="wish.typeOfFreight.label" default="Type Of Freight" /></label>
						<div class="controls">
							<g:select id="typeOfFreight" name="typeOfFreight.id" from="${modal.TypeOfFreight.list()}" optionKey="id" value="${wishInstance?.typeOfFreight?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'typeOfFreight', 'error')}</span>
						</div>
					</div>
							
				</div>
			</div>		
			
			<g:render template="loadUnits" model="['wishInstance':wishInstance]"/>

	    </div>
	</div>
</div>

<div id="djaiInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseDjai">
			<g:message code="wish.title.djai.label" default="DJAI"/>
		</a>
		</h4>
	</div>
	<div id="collapseDjai" class="accordion-body collapse in">
		<div class="accordion-inner">	
			<div class="row-fluid">
				<div class="span6">

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'licenses', 'error')} ">
						<label for="licenses" class="control-label"><g:message code="wish.licenses.label" default="Licenses" /></label>
						<div class="controls">
							<bs:checkBox name="licenses" value="${wishInstance?.licenses}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'licenses', 'error')}</span>
						</div>
					</div>
							
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiNumber', 'error')} ">
						<label for="dispatchNumber" class="control-label"><g:message code="wish.djaiNumber.label" default="Djai Number" /></label>
						<div class="controls">
							<g:textField name="djaiNumber" value="${wishInstance?.djaiNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiNumber', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiFormalizationDate', 'error')}">
						<label for="djaiFormalizationDate" class="control-label"><g:message code="wish.djaiFormalizationDate.label" default="Djai Formalization Date" /></label>
						<div class="controls">
							<bs:datePicker dateFormat="dd/MM/yyyy" name="djaiFormalizationDate" precision="day"  value="${wishInstance?.djaiFormalizationDate}"  />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiFormalizationDate', 'error')}</span>
						</div>
					</div>

				</div>
				<div class="span6">
				
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiExtendedRequested', 'error')} ">
						<label for="djaiExtendedRequested" class="control-label"><g:message code="wish.djaiExtendedRequested.label" default="Djai Extended Requested" /></label>
						<div class="controls">
							<bs:datePicker name="djaiExtendedRequested" precision="day"  value="${wishInstance?.djaiExtendedRequested}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiExtendedRequested', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'djaiExtendedExpiration', 'error')} ">
						<label for="djaiExtendedExpiration" class="control-label"><g:message code="wish.djaiExtendedExpiration.label" default="Djai Extended Expiration" /></label>
						<div class="controls">
							<bs:datePicker name="djaiExtendedExpiration" precision="day"  value="${wishInstance?.djaiExtendedExpiration}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'djaiExtendedExpiration', 'error')}</span>
						</div>
					</div>
				
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="positioTariffnInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapsePositionTariff">
			<g:message code="wish.title.positionTariff.label" default="Position tariff"/>
		</a>
		</h4>
	</div>
	<div id="collapsePositionTariff" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">



					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'hsCodeToBeWritten', 'error')} ">
						<label for="hsCodeToBeWritten" class="control-label"><g:message code="wish.hsCodeToBeWritten.label" default="Hs Code To Be Written" /></label>
						<div class="controls">
							<g:textField name="hsCodeToBeWritten" value="${wishInstance?.hsCodeToBeWritten}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'hsCodeToBeWritten', 'error')}</span>
						</div>
					</div>
					
				
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'criterionValue', 'error')} ">
						<label for="criterionValue" class="control-label"><g:message code="wish.criterionValue.label" default="Criterion Value" /></label>
						<div class="controls">
							<g:select id="criterionValue" name="criterionValue.id" from="${modal.CriterionValue.list()}" optionKey="id" value="${wishInstance?.criterionValue?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'criterionValue', 'error')}</span>
						</div>
					</div>		
				</div>
				<div class="span6">

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'visaChargePayment', 'error')} ">
						<label for="visaChargePayment" class="control-label"><g:message code="wish.visaChargePayment.label" default="Visa Charge Payment" /></label>
						<div class="controls">
							<g:field type="number" name="visaChargePayment" step="any" value="${wishInstance.visaChargePayment}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'visaChargePayment', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'visaChargePaymentConcept', 'error')} ">
						<label for="visaChargePaymentConcept" class="control-label"><g:message code="wish.visaChargePaymentConcept.label" default="Visa Charge Payment Concept" /></label>
						<div class="controls">
							<g:select id="visaChargePaymentConcept" name="visaChargePaymentConcept.id" from="${modal.VisaChargePaymentConcept.list()}" optionKey="id" value="${wishInstance?.visaChargePaymentConcept?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'visaChargePaymentConcept', 'error')}</span>
						</div>
					</div>	
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'visaSecondStage', 'error')} ">
						<label for="visaSecondStage" class="control-label"><g:message code="wish.visaSecondStage.label" default="Visa second stage?" /></label>
						<div class="controls">
							<bs:checkBox name="visaSecondStage" value="${wishInstance?.visaSecondStage}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'visaSecondStage', 'error')}</span>
						</div>
					</div>
					

				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="swiftsInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSwifts">
			<g:message code="wish.title.swifts.label" default="Swifts"/>
		</a>
		</h4>
	</div>
	<div id="collapseSwifts" class="accordion-body collapse in">
		<div class="accordion-inner">

			<div class="row-fluid">
				<div class="span6">


					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'swiftReceivedDate', 'error')} ">
						<label for="swiftReceivedDate" class="control-label"><g:message code="wish.swiftReceivedDate.label" default="Swift Received Date" /></label>
						<div class="controls">
							<bs:datePicker name="swiftReceivedDate" precision="day"  value="${wishInstance?.swiftReceivedDate}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'swiftReceivedDate', 'error')}</span>
						</div>
					</div>
											
				</div>
				
				<div class="span6">
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'swiftSentToSupplierDate', 'error')} ">
						<label for="swiftSentToSupplierDate" class="control-label"><g:message code="wish.swiftSentToSupplierDate.label" default="Swift Sent To Supplier Date" /></label>
						<div class="controls">
							<bs:datePicker name="swiftSentToSupplierDate" precision="day"  value="${wishInstance?.swiftSentToSupplierDate}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'swiftSentToSupplierDate', 'error')}</span>
						</div>
					</div>	
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="documentInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseDocument">
		 	<g:message code="wish.title.document.label" default="Documents"/>
		</a>
		</h4>
	</div>
	<div id="collapseDocument" class="accordion-body collapse in">
		<div class="accordion-inner">
			<g:render template="document" model="['wishInstance':wishInstance]"/>
	    </div>
	</div>
</div>

<div id="draftInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseDraft">
			<g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery"/>
		</a>
		</h4>
	</div>
	<div id="collapseDraft" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftApproved', 'error')} ">
						<label for="docDraftApproved" class="control-label"><g:message code="wish.docDraftApproved.label" default="Doc Draft Approved" /></label>
						<div class="controls">
							<bs:datePicker name="docDraftApproved" precision="day"  value="${wishInstance?.docDraftApproved}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'docDraftApproved', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesAndLoadReceived', 'error')} ">
						<label for="picturesOfPrintingBoxesAndLoadReceived" class="control-label"><g:message code="wish.picturesOfPrintingBoxesAndLoadReceived.label" default="Pictures Of Printing Boxes And Load Received" /></label>
						<div class="controls">
							<bs:datePicker name="picturesOfPrintingBoxesAndLoadReceived" precision="day"  value="${wishInstance?.picturesOfPrintingBoxesAndLoadReceived}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesAndLoadReceived', 'error')}</span>
						</div>
					</div>
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainerReceived', 'error')} ">
						<label for="picturesOfLoadingContainerReceived" class="control-label"><g:message code="wish.picturesOfLoadingContainerReceived.label" default="Pictures Of Loading Container Received" /></label>
						<div class="controls">
							<bs:datePicker name="picturesOfLoadingContainerReceived" precision="day"  value="${wishInstance?.picturesOfLoadingContainerReceived}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainerReceived', 'error')}</span>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftNotReceive', 'error')} ">
						<label for="docDraftNotReceive" class="control-label"><g:message code="wish.docDraftNotReceive.label" default="Draft won't be received" /></label>
						<div class="controls">
							<bs:checkBox name="docDraftNotReceive" value="${wishInstance?.docDraftNotReceive}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'docDraftNotReceive', 'error')}</span>
						</div>
					</div>
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesNotReceive', 'error')} ">
						<label for="picturesOfPrintingBoxesNotReceive" class="control-label"><g:message code="wish.picturesOfPrintingBoxesNotReceive.label" default="Pictures of printing boxes won't be received" /></label>
						<div class="controls">
							<bs:checkBox name="picturesOfPrintingBoxesNotReceive" value="${wishInstance?.picturesOfPrintingBoxesNotReceive}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfPrintingBoxesNotReceive', 'error')}</span>
						</div>
					</div>
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainerNotReceive', 'error')} ">
						<label for="picturesOfLoadingContainerNotReceive" class="control-label"><g:message code="wish.picturesOfLoadingContainerNotReceive.label" default="Pictures of loading container won't be received" /></label>
						<div class="controls">
							<bs:checkBox name="picturesOfLoadingContainerNotReceive" value="${wishInstance?.picturesOfLoadingContainerNotReceive}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'picturesOfLoadingContainerNotReceive', 'error')}</span>
						</div>
					</div>

				</div>
			</div>

			<g:render template="draft" model="['wishInstance':wishInstance]"/>
	    </div>
	</div>
</div>

<div id="freightInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFreight">
			<g:message code="wish.title.freight.label" default="Freight"/>
		</a>
		</h4>
	</div>
	<div id="collapseFreight" class="accordion-body collapse in">
		<div class="accordion-inner">			
			<div class="row-fluid">
				<div class="span6">

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'sourceCountry', 'error')} ">
						<label for="sourceCountry" class="control-label"><g:message code="wish.sourceCountry.label" default="Source Country" /></label>
						<div class="controls">
							<g:select id="sourceCountry" name="sourceCountry.id" from="${modal.Country.list()}" optionKey="id" value="${wishInstance?.sourceCountry?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'sourceCountry', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'port', 'error')} ">
						<label for="port" class="control-label"><g:message code="wish.port.label" default="Port" /></label>
						<div class="controls">
							<g:select id="port" name="port.id" from="${modal.Port.list()}" optionKey="id" value="${wishInstance?.port?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'port', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'ship', 'error')} ">
						<label for="ship" class="control-label"><g:message code="wish.ship.label" default="Ship" /></label>
						<div class="controls">
							<g:select id="ship" name="ship.id" from="${modal.Ship.list(sort:"name")}" optionKey="id" value="${wishInstance?.ship?.id}" class="many-to-one" noSelection="['null': '']"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'ship', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'hasFeeder', 'error')} ">
						<label for="hasFeeder" class="control-label"><g:message code="wish.hasFeeder.label" default="Has feeder" /></label>
						<div class="controls">
							<bs:checkBox name="hasFeeder" value="${wishInstance?.hasFeeder}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'hasFeeder', 'error')}</span>
						</div>
					</div>			

				</div>
				<div class="span6">

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'blNumber', 'error')} ">
						<label for="blNumber" class="control-label"><g:message code="wish.blNumber.label" default="Bl Number" /></label>
						<div class="controls">
							<g:textField name="blNumber" value="${wishInstance?.blNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'blNumber', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'blCopyReceived', 'error')} ">
						<label for="blCopyReceived" class="control-label"><g:message code="wish.blCopyReceived.label" default="Bl copy received?" /></label>
						<div class="controls">
							<bs:checkBox name="blCopyReceived" value="${wishInstance?.blCopyReceived}" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'blCopyReceived', 'error')}</span>
						</div>
					</div>
					
					

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'freightQuote', 'error')} ">
						<label for="freightQuote" class="control-label"><g:message code="wish.freightQuote.label" default="Freight Quote" /></label>
						<div class="controls">
							<g:field type="number" name="freightQuote" step="any" value="${wishInstance.freightQuote}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'freightQuote', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'loadSecuredPercent', 'error')} ">
						<label for="loadSecuredPercent" class="control-label"><g:message code="wish.loadSecuredPercent.label" default="Load Secured Percent" /></label>
						<div class="controls">
							<g:field type="number" name="loadSecuredPercent" step="any" value="${wishInstance.loadSecuredPercent}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'loadSecuredPercent', 'error')}</span>
						</div>
					</div>
				
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="finalInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFinal">
			<g:message code="wish.title.final.label" default="Final data"/>
		</a>
		</h4>
	</div>
	<div id="collapseFinal" class="accordion-body collapse in">
		<div class="accordion-inner">
			<div class="row-fluid">
				<div class="span6">
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'bill', 'error')} ">
						<label for="bill" class="control-label"><g:message code="wish.bill.label" default="Bill" /></label>
						<div class="controls">
							<g:textField name="bill" value="${wishInstance?.bill}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'bill', 'error')}</span>
						</div>
					</div>		

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'billDate', 'error')} ">
						<label for="billDate" class="control-label"><g:message code="wish.billDate.label" default="Bill Date" /></label>
						<div class="controls">
							<bs:datePicker name="billDate" precision="day"  value="${wishInstance?.billDate}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'billDate', 'error')}</span>
						</div>
					</div>

					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'taxRegistryNumberAndCuitVerification', 'error')} ">
						<label for="taxRegistryNumberAndCuitVerification" class="control-label"><g:message code="wish.taxRegistryNumberAndCuitVerification.label" default="Tax Registry Number And Cuit Verification" /></label>
						<div class="controls">
							<bs:datePicker name="taxRegistryNumberAndCuitVerification" precision="day"  value="${wishInstance?.taxRegistryNumberAndCuitVerification}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'taxRegistryNumberAndCuitVerification', 'error')}</span>
						</div>
					</div>
															
				</div>
				<div class="span6">
			
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'dispatchNumber', 'error')} ">
						<label for="dispatchNumber" class="control-label"><g:message code="wish.dispatchNumber.label" default="Dispatch Number" /></label>
						<div class="controls">
							<g:textField name="dispatchNumber" value="${wishInstance?.dispatchNumber}"/>
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'dispatchNumber', 'error')}</span>
						</div>
					</div>
					
					<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'finishDate', 'error')} ">
						<label for="finishDate" class="control-label"><g:message code="wish.finishDate.label" default="Finish Date" /></label>
						<div class="controls">
							<bs:datePicker name="finishDate" precision="day"  value="${wishInstance?.finishDate}" default="none" noSelection="['': '']" />
							<span class="help-inline">${hasErrors(bean: wishInstance, field: 'finishDate', 'error')}</span>
						</div>
					</div>


				
				</div>
			</div>		
	    </div>
	</div>
</div>

<div id="notesInfo" class="accordion-group">
	<div class="accordion-heading">
		<h4>
		<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseNotes">
			<g:message code="wish.notes.label" default="Notes" />
		</a>
		</h4>
	</div>
	<div id="collapseNotes" class="accordion-body collapse in">
		<div class="accordion-inner">
			<g:render template="/_note/noteForm" model="['notes': wishInstance?.notes, 'notesCount': wishInstance?.notes?.size(), 'id': wishInstance?.id]"/>´
	    </div>
	</div>
</div>

<script>
function getCustomerOpNumber(inputSelect){
	var call = '${createLink(controller:'wish', action:'getNextCustomerOpNumber')}/'+inputSelect.value;
	$.get(call,function(result){
		
		$('#customerOpNumber').val(result);
	});
}

function calculateBalance(){

	var currencyFob = $('#currencyFob').val();
	var amountOfMoneyInAdvanceTransferred = $('#amountOfMoneyInAdvanceTransferred').val();
	
	$('#moneyBalance').val((currencyFob-amountOfMoneyInAdvanceTransferred).toFixed(4));
}
</script>
