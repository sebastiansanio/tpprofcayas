<%@ page import="wish.Picture" %>



			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'image', 'error')} required">
				<label for="image" class="control-label"><g:message code="picture.image.label" default="Image" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="image" name="image" />
					<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'image', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="picture.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${pictureInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'description', 'error')}</span>
				</div>
			</div>


