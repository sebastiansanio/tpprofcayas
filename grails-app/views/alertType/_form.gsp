<%@ page import="alert.AlertType" %>



			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="alertType.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${alertTypeInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'nameOfEstimatedDateField', 'error')} required">
				<label for="nameOfEstimatedDateField" class="control-label"><g:message code="alertType.nameOfEstimatedDateField.label" default="Name Of Estimated Date Field" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nameOfEstimatedDateField" required="" value="${alertTypeInstance?.nameOfEstimatedDateField}"/>
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'nameOfEstimatedDateField', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'nameOfCompletionField', 'error')} required">
				<label for="nameOfCompletionField" class="control-label"><g:message code="alertType.nameOfCompletionField.label" default="Name Of Completion Field" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nameOfCompletionField" required="" value="${alertTypeInstance?.nameOfCompletionField}"/>
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'nameOfCompletionField', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'alertTerm', 'error')} required">
				<label for="alertTerm" class="control-label"><g:message code="alertType.alertTerm.label" default="Alert Term" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="alertTerm" required="" value="${alertTypeInstance.alertTerm}"/>
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'alertTerm', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'alerts', 'error')} ">
				<label for="alerts" class="control-label"><g:message code="alertType.alerts.label" default="Alerts" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${alertTypeInstance?.alerts?}" var="a">
    <li><g:link controller="alert" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="alert" action="create" params="['alertType.id': alertTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'alert.label', default: 'Alert')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'alerts', 'error')}</span>
				</div>
			</div>

