<%@ page import="report.ProductWishReport" %>



			<div class="control-group fieldcontain ${hasErrors(bean: productWishReportInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="productWishReport.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${productWishReportInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: productWishReportInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productWishReportInstance, field: 'fields', 'error')} ">
				<label for="fields" class="control-label"><g:message code="productWishReport.fields.label" default="Fields" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: productWishReportInstance, field: 'fields', 'error')}</span>
				</div>
			</div>

