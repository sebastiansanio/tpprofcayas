<%@ page import="report.ReportSendConfiguration" %>

<div class="row-fluid">

<div class="span5">

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'nextSendDate', 'error')} required">
				<label for="nextSendDate" class="control-label"><g:message code="reportSendConfiguration.nextSendDate.label" default="Next Send Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="nextSendDate" precision="day"  value="${reportSendConfigurationInstance?.nextSendDate}"  />
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'nextSendDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'frequencyInDays', 'error')} ">
				<label for="frequencyInDays" class="control-label"><g:message code="reportSendConfiguration.frequencyInDays.label" default="Frequency In Days" /></label>
				<div class="controls">
					<g:field type="number" name="frequencyInDays" value="${reportSendConfigurationInstance.frequencyInDays}"/>
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'frequencyInDays', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'stakeholder', 'error')} required">
				<label for="stakeholder" class="control-label"><g:message code="reportSendConfiguration.stakeholder.label" default="Stakeholder" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="stakeholder" name="stakeholder.id" from="${stakeholder.Stakeholder.list()}" optionKey="id" required="" value="${reportSendConfigurationInstance?.stakeholder?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'stakeholder', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'subject', 'error')} required">
				<label for="subject" class="control-label"><g:message code="reportSendConfiguration.subject.label" default="Subject" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="subject" required="" value="${reportSendConfigurationInstance?.subject}"/>
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'subject', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'body', 'error')} required">
				<label for="body" class="control-label"><g:message code="reportSendConfiguration.body.label" default="Body" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="body" cols="40" rows="5" maxlength="1000" required="" value="${reportSendConfigurationInstance?.body}"/>
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'body', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'report', 'error')} required">
				<label for="report" class="control-label"><g:message code="reportSendConfiguration.report.label" default="Report" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="report" name="report.id" from="${report.Report.list()}" optionKey="id" required="" value="${reportSendConfigurationInstance?.report?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'report', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'hour', 'error')} ">
				<label for="hour" class="control-label"><g:message code="reportSendConfiguration.hour.label" default="Hour" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField required="" name="hour" pattern="${reportSendConfigurationInstance.constraints.hour.matches}" value="${reportSendConfigurationInstance?.hour}"/>
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'hour', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportSendConfigurationInstance, field: 'active', 'error')} ">
				<label for="active" class="control-label"><g:message code="reportSendConfiguration.active.label" default="Active" /></label>
				<div class="controls">
					<bs:checkBox name="active" value="${reportSendConfigurationInstance?.active}" />
					<span class="help-inline">${hasErrors(bean: reportSendConfigurationInstance, field: 'active', 'error')}</span>
				</div>
			</div>

</div>
<div class="span5">

	<p>	<g:message code="transformText.header.message" default="You can use the following variables:" /></p>
	<p>	<g:message code="transformText.variable1.message" default="[week] = Number of week in year" /></p>
	

</div>