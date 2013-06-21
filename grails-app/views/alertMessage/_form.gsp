<%@ page import="alert.AlertMessage" %>



			<div class="control-group fieldcontain ${hasErrors(bean: alertMessageInstance, field: 'subject', 'error')} required">
				<label for="subject" class="control-label"><g:message code="alertMessage.subject.label" default="Subject" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="subject" required="" value="${alertMessageInstance?.subject}"/>
					<span class="help-inline">${hasErrors(bean: alertMessageInstance, field: 'subject', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: alertMessageInstance, field: 'message', 'error')} required">
				<label for="message" class="control-label"><g:message code="alertMessage.message.label" default="Message" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea cols="40" rows="5" name="message" required="" value="${alertMessageInstance?.message}"/>
					<span class="help-inline">${hasErrors(bean: alertMessageInstance, field: 'message', 'error')}</span>
				</div>
			</div>



			<div class="control-group fieldcontain ${hasErrors(bean: alertMessageInstance, field: 'language', 'error')} required">
				<label for="language" class="control-label"><g:message code="alertMessage.language.label" default="Language" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="language" name="language.id" from="${modal.AvailableLocale.list()}" optionKey="id" required="" value="${alertMessageInstance?.language?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: alertMessageInstance, field: 'language', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: alertMessageInstance, field: 'alertType', 'error')} required">
				<label for="alertType" class="control-label"><g:message code="alertMessage.alertType.label" default="Alert Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="alertType" name="alertType.id" from="${alert.AlertType.list()}" optionKey="id" required="" value="${alertMessageInstance?.alertType?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: alertMessageInstance, field: 'alertType', 'error')}</span>
				</div>
			</div>

