<%@ page import="courier.Courier" %>



			<div class="control-group fieldcontain ${hasErrors(bean: courierInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="courier.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${courierInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: courierInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: courierInstance, field: 'web', 'error')} ">
				<label for="web" class="control-label"><g:message code="courier.web.label" default="Web" /></label>
				<div class="controls">
					<g:textField name="web" value="${courierInstance?.web}"/>
					<span class="help-inline">${hasErrors(bean: courierInstance, field: 'web', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: courierInstance, field: 'telephone', 'error')} ">
				<label for="telephone" class="control-label"><g:message code="courier.telephone.label" default="Telephone" /></label>
				<div class="controls">
					<g:textField name="telephone" value="${courierInstance?.telephone}"/>
					<span class="help-inline">${hasErrors(bean: courierInstance, field: 'telephone', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: courierInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="courier.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${courierInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: courierInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: courierInstance, field: 'cuit', 'error')} ">
				<label for="cuit" class="control-label"><g:message code="courier.cuit.label" default="Cuit" /></label>
				<div class="controls">
					<g:textField name="cuit" value="${courierInstance?.cuit}"/>
					<span class="help-inline">${hasErrors(bean: courierInstance, field: 'cuit', 'error')}</span>
				</div>
			</div>

