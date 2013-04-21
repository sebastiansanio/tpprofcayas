<%@ page import="stakeholder.Contact" %>



			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="contact.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${contactInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="contact.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${contactInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'position', 'error')} ">
				<label for="position" class="control-label"><g:message code="contact.position.label" default="Position" /></label>
				<div class="controls">
					<g:textField name="position" value="${contactInstance?.position}"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'position', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'birthday', 'error')} ">
				<label for="birthday" class="control-label"><g:message code="contact.birthday.label" default="Birthday" /></label>
				<div class="controls">
					<bs:datePicker name="birthday" precision="day"  value="${contactInstance?.birthday}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'birthday', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} ">
				<label for="phone" class="control-label"><g:message code="contact.phone.label" default="Phone" /></label>
				<div class="controls">
					<g:textField name="phone" value="${contactInstance?.phone}"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'phone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'cellPhone', 'error')} ">
				<label for="cellPhone" class="control-label"><g:message code="contact.cellPhone.label" default="Cell Phone" /></label>
				<div class="controls">
					<g:textField name="cellPhone" value="${contactInstance?.cellPhone}"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'cellPhone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'note', 'error')} ">
				<label for="note" class="control-label"><g:message code="contact.note.label" default="Note" /></label>
				<div class="controls">
					<g:textArea rows="5" name="note" value="${contactInstance?.note}"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'note', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'sendAlerts', 'error')} ">
				<label for="sendAlerts" class="control-label"><g:message code="contact.sendAlerts.label" default="Send Alerts" /></label>
				<div class="controls">
					<bs:checkBox name="sendAlerts" value="${contactInstance?.sendAlerts}" />
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'sendAlerts', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'sendReports', 'error')} ">
				<label for="sendReports" class="control-label"><g:message code="contact.sendReports.label" default="Send Reports" /></label>
				<div class="controls">
					<bs:checkBox name="sendReports" value="${contactInstance?.sendReports}" />
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'sendReports', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'stakeholder', 'error')} required">
				<label for="stakeholder" class="control-label"><g:message code="contact.stakeholder.label" default="Stakeholder" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="stakeholder" name="stakeholder.id" from="${stakeholder.Stakeholder.list()}" optionKey="id" required="" value="${contactInstance?.stakeholder?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: contactInstance, field: 'stakeholder', 'error')}</span>
				</div>
			</div>

