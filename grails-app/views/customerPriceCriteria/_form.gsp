<%@ page import="prices.CustomerPriceCriteria" %>



			<div class="control-group fieldcontain ${hasErrors(bean: customerPriceCriteriaInstance, field: 'comission', 'error')} required">
				<label for="comission" class="control-label"><g:message code="customerPriceCriteria.comission.label" default="Comission" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="comission" step="any" required="" value="${customerPriceCriteriaInstance.comission}"/>
					<span class="help-inline">${hasErrors(bean: customerPriceCriteriaInstance, field: 'comission', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerPriceCriteriaInstance, field: 'customerGroup', 'error')} required">
				<label for="customerGroup" class="control-label"><g:message code="customerPriceCriteria.customerGroup.label" default="Customer Group" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customerGroup" name="customerGroup.id" from="${prices.CustomerGroup.list()}" optionKey="id" required="" value="${customerPriceCriteriaInstance?.customerGroup?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerPriceCriteriaInstance, field: 'customerGroup', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerPriceCriteriaInstance, field: 'extra1', 'error')} required">
				<label for="extra1" class="control-label"><g:message code="customerPriceCriteria.extra1.label" default="Extra1" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="extra1" step="any" required="" value="${customerPriceCriteriaInstance.extra1}"/>
					<span class="help-inline">${hasErrors(bean: customerPriceCriteriaInstance, field: 'extra1', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerPriceCriteriaInstance, field: 'extra2', 'error')} required">
				<label for="extra2" class="control-label"><g:message code="customerPriceCriteria.extra2.label" default="Extra2" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="extra2" step="any" required="" value="${customerPriceCriteriaInstance.extra2}"/>
					<span class="help-inline">${hasErrors(bean: customerPriceCriteriaInstance, field: 'extra2', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerPriceCriteriaInstance, field: 'family', 'error')} required">
				<label for="family" class="control-label"><g:message code="customerPriceCriteria.family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${product.Family.list()}" optionKey="id" required="" value="${customerPriceCriteriaInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: customerPriceCriteriaInstance, field: 'family', 'error')}</span>
				</div>
			</div>

