<%@ page import="modal.WishStatus" %>



			<div class="control-group fieldcontain ${hasErrors(bean: wishStatusInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="wishStatus.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${wishStatusInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: wishStatusInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: wishStatusInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="wishStatus.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${wishStatusInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: wishStatusInstance, field: 'description', 'error')}</span>
				</div>
			</div>

