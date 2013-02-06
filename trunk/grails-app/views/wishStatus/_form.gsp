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

			<div class="control-group fieldcontain ${hasErrors(bean: wishStatusInstance, field: 'wishes', 'error')} ">
				<label for="wishes" class="control-label"><g:message code="wishStatus.wishes.label" default="Wishes" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${wishStatusInstance?.wishes?}" var="w">
    <li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="wish" action="create" params="['wishStatus.id': wishStatusInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: wishStatusInstance, field: 'wishes', 'error')}</span>
				</div>
			</div>

