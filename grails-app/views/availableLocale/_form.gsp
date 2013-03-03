<%@ page import="modal.AvailableLocale" %>



			<div class="control-group fieldcontain ${hasErrors(bean: availableLocaleInstance, field: 'country', 'error')} ">
				<label for="country" class="control-label"><g:message code="availableLocale.country.label" default="Country" /></label>
				<div class="controls">
					<g:textField name="country" value="${availableLocaleInstance?.country}"/>
					<span class="help-inline">${hasErrors(bean: availableLocaleInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: availableLocaleInstance, field: 'language', 'error')} ">
				<label for="language" class="control-label"><g:message code="availableLocale.language.label" default="Language" /></label>
				<div class="controls">
					<g:textField name="language" value="${availableLocaleInstance?.language}"/>
					<span class="help-inline">${hasErrors(bean: availableLocaleInstance, field: 'language', 'error')}</span>
				</div>
			</div>

