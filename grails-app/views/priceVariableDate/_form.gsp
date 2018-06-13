<%@ page import="prices.PriceVariableDate" %>



			<div class="control-group fieldcontain ${hasErrors(bean: priceVariableDateInstance, field: 'dateFrom', 'error')} required">
				<label for="dateFrom" class="control-label"><g:message code="priceVariableDate.dateFrom.label" default="Date From" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="dateFrom" precision="day"  value="${priceVariableDateInstance?.dateFrom}"  />
					<span class="help-inline">${hasErrors(bean: priceVariableDateInstance, field: 'dateFrom', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: priceVariableDateInstance, field: 'dateTo', 'error')} required">
				<label for="dateTo" class="control-label"><g:message code="priceVariableDate.dateTo.label" default="Date To" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="dateTo" precision="day"  value="${priceVariableDateInstance?.dateTo}"  />
					<span class="help-inline">${hasErrors(bean: priceVariableDateInstance, field: 'dateTo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: priceVariableDateInstance, field: 'priceVariable', 'error')} required">
				<label for="priceVariable" class="control-label"><g:message code="priceVariableDate.priceVariable.label" default="Price Variable" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="priceVariable" name="priceVariable.id" from="${prices.PriceVariable.list()}" optionKey="id" required="" value="${priceVariableDateInstance?.priceVariable?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: priceVariableDateInstance, field: 'priceVariable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: priceVariableDateInstance, field: 'price', 'error')} required">
				<label for="price" class="control-label"><g:message code="priceVariableDate.price.label" default="Price" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="price" step="any" required="" value="${priceVariableDateInstance.price}"/>
					<span class="help-inline">${hasErrors(bean: priceVariableDateInstance, field: 'price', 'error')}</span>
				</div>
			</div>

