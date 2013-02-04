<%@ page import="modal.ShippingMark" %>



			<div class="control-group fieldcontain ${hasErrors(bean: shippingMarkInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="shippingMark.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${shippingMarkInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: shippingMarkInstance, field: 'name', 'error')}</span>
				</div>
			</div>

