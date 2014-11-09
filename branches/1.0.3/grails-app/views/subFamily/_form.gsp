<%@ page import="product.SubFamily" %>



			<div class="control-group fieldcontain ${hasErrors(bean: subFamilyInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="subFamily.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${subFamilyInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: subFamilyInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subFamilyInstance, field: 'family', 'error')} required">
				<label for="family" class="control-label"><g:message code="subFamily.family.label" default="Family" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${product.Family.list()}" noSelection="['null': '']" optionKey="id" required="" value="${subFamilyInstance?.family?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: subFamilyInstance, field: 'family', 'error')}</span>
				</div>
			</div>