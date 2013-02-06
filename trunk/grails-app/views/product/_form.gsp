<%@ page import="product.Product" %>



			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'descriptionES', 'error')} required">
				<label for="descriptionES" class="control-label"><g:message code="product.descriptionES.label" default="Description ES" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="descriptionES" required="" value="${productInstance?.descriptionES}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'descriptionES', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="product.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${productInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'color', 'error')} required">
				<label for="color" class="control-label"><g:message code="product.color.label" default="Color" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="color" name="color.id" from="${product.Color.list()}" optionKey="id" required="" value="${productInstance?.color?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'color', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'family', 'error')} ">
				<label for="family" class="control-label"><g:message code="product.family.label" default="Family" /></label>
				<div class="controls">
					<g:select id="family" name="family.id" from="${product.Family.list()}" optionKey="id" value="${productInstance?.family?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'family', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'subFamily', 'error')} ">
				<label for="subFamily" class="control-label"><g:message code="product.subFamily.label" default="Sub Family" /></label>
				<div class="controls">
					<g:select id="subFamily" name="subFamily.id" from="${product.SubFamily.list()}" optionKey="id" value="${productInstance?.subFamily?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'subFamily', 'error')}</span>
				</div>
			</div>


