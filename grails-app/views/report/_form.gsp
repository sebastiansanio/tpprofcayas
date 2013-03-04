<%@ page import="report.Report" %>
<%@ page import="wish.Wish" %>



			<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="report.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${reportInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: reportInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'fields', 'error')} ">
				<label for="fields" class="control-label"><g:message code="report.fields.label" default="Fields" /></label>
				<div class="controls">
															
					<g:select size="15" id="fields" name="fields" from="${new Wish().domainClass.properties}" optionKey="name" optionValue="${{message(code:'wish.'+it.name+'.label')}}" required="" value="${reportInstance?.fields}" multiple="multiple"/>
					
					<span class="help-inline">${hasErrors(bean: reportInstance, field: 'fields', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'pendingOnly', 'error')} ">
				<label for="pendingOnly" class="control-label"><g:message code="report.pendingOnly.label" default="Pending Only" /></label>
				<div class="controls">
					<bs:checkBox name="pendingOnly" value="${reportInstance?.pendingOnly}" />
					<span class="help-inline">${hasErrors(bean: reportInstance, field: 'pendingOnly', 'error')}</span>
				</div>
			</div>

