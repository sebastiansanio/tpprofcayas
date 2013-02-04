<%@ page import="modal.CriterionValue" %>



			<div class="control-group fieldcontain ${hasErrors(bean: criterionValueInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="criterionValue.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${criterionValueInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: criterionValueInstance, field: 'name', 'error')}</span>
				</div>
			</div>

