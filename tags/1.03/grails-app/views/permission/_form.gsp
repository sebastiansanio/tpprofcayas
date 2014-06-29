<%@ page import="login.Permission" %>



			<div class="control-group fieldcontain ${hasErrors(bean: permissionInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="permission.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${permissionInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: permissionInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: permissionInstance, field: 'permissionString', 'error')} required">
				<label for="permissionString" class="control-label"><g:message code="permission.permissionString.label" default="Permission String" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="permissionString" required="" value="${permissionInstance?.permissionString}"/>
					<span class="help-inline">${hasErrors(bean: permissionInstance, field: 'permissionString', 'error')}</span>
				</div>
			</div>

