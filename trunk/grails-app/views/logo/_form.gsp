<%@ page import="helper.Logo" %>



			<div class="control-group fieldcontain ${hasErrors(bean: logoInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="logo.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField required="" name="name" value="${logoInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: logoInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logoInstance, field: 'image', 'error')} required">
				<label for="image" class="control-label"><g:message code="logo.image.label" default="Image" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input required="" type="file" id="image" name="image" />
					<span class="help-inline">${hasErrors(bean: logoInstance, field: 'image', 'error')}</span>
				</div>
			</div>

