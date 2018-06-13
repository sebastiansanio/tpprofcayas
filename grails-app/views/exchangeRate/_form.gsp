<%@ page import="prices.ExchangeRate" %>



			<div class="control-group fieldcontain ${hasErrors(bean: exchangeRateInstance, field: 'currency', 'error')} required">
				<label for="currency" class="control-label"><g:message code="exchangeRate.currency.label" default="Currency" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="currency" name="currency.id" from="${modal.Currency.list()}" optionKey="id" required="" value="${exchangeRateInstance?.currency?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: exchangeRateInstance, field: 'currency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: exchangeRateInstance, field: 'date', 'error')} required">
				<label for="date" class="control-label"><g:message code="exchangeRate.date.label" default="Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="date" precision="day"  value="${exchangeRateInstance?.date}"  />
					<span class="help-inline">${hasErrors(bean: exchangeRateInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: exchangeRateInstance, field: 'value', 'error')} required">
				<label for="value" class="control-label"><g:message code="exchangeRate.value.label" default="Value" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="value" step="any" required="" value="${exchangeRateInstance.value}"/>
					<span class="help-inline">${hasErrors(bean: exchangeRateInstance, field: 'value', 'error')}</span>
				</div>
			</div>

