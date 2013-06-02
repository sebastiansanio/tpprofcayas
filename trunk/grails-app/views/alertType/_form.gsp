<%@ page import="alert.AlertType" %>
<%@ page import="wish.Wish" %>



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
				
					<g:select id="nameOfEstimatedDateField" name="nameOfEstimatedDateField" from="${new Wish().domainClass.properties.findAll{it.type == Date.class}}" value="${alertTypeInstance.nameOfEstimatedDateField}" optionKey="name" optionValue="${{message(code:'wish.'+it.name+'.label')}}" />
				
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'nameOfEstimatedDateField', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'nameOfCompletionField', 'error')} required">
				<label for="nameOfCompletionField" class="control-label"><g:message code="alertType.nameOfCompletionField.label" default="Name Of Completion Field" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="nameOfCompletionField" name="nameOfCompletionField" from="${new Wish().domainClass.properties.findAll{it.type == Date.class}}" value="${alertTypeInstance.nameOfCompletionField}" optionKey="name" optionValue="${{message(code:'wish.'+it.name+'.label')}}" />
				
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

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'frequency', 'error')} ">
				<label for="frequency" class="control-label"><g:message code="alertType.frequency.label" default="Frequency" /></label>
				<div class="controls">
					<g:field type="number" name="frequency" value="${alertTypeInstance.frequency}"/>
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'frequency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertTypeInstance, field: 'stakeholders', 'error')} ">
				<label for="stakeholders" class="control-label"><g:message code="alertType.stakeholders.label" default="Stakeholders" /></label>
				<div class="controls">
					
					<g:select name="stakeholders" from="${['agent','customer','customsBroker','forwarder','shipper','supplier']}" optionValue="${{message(code:'wish.'+it+'.label')}}" value="${alertTypeInstance.stakeholders}" multiple="multiple" size="6"  />
					<span class="help-inline">${hasErrors(bean: alertTypeInstance, field: 'stakeholders', 'error')}</span>
				</div>
			</div>

					

