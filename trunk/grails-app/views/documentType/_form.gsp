<%@ page import="modal.DocumentType" %>



			<div class="control-group fieldcontain ${hasErrors(bean: documentTypeInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="documentType.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${documentTypeInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: documentTypeInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentTypeInstance, field: 'type', 'error')} ">
				<label for="type" class="control-label"><g:message code="documentType.type.label" default="Type" /></label>
				<div class="controls">
					<g:select name="type" from="${documentTypeInstance.constraints.type.inList}" value="${documentTypeInstance?.type}" optionValue="${{message(code:'documentType.'+it+'.label')}}" />
					<span class="help-inline">${hasErrors(bean: documentTypeInstance, field: 'type', 'error')}</span>
				</div>
			</div>

			
			<div class="control-group fieldcontain ${hasErrors(bean: documentTypeInstance, field: 'requiresVisa', 'error')} ">
				<label for="requiresVisa" class="control-label"><g:message code="documentType.requiresVisa.label" default="Requires Visa?" /></label>
				<div class="controls">
					<bs:checkBox name="requiresVisa" value="${documentTypeInstance?.requiresVisa}" />
					<span class="help-inline">${hasErrors(bean: documentTypeInstance, field: 'requiresVisa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: documentTypeInstance, field: 'isBl', 'error')} ">
				<label for="isBl" class="control-label"><g:message code="documentType.isBl.label" default="Is Bl?" /></label>
				<div class="controls">
					<bs:checkBox name="isBl" value="${documentTypeInstance?.isBl}" />
					<span class="help-inline">${hasErrors(bean: documentTypeInstance, field: 'isBl', 'error')}</span>
				</div>
			</div>
			