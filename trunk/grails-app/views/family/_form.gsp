<%@ page import="product.Family" %>



			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="family.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${familyInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'products', 'error')} ">
				<label for="products" class="control-label"><g:message code="family.products.label" default="Products" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${familyInstance?.products?}" var="p">
    <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="product" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Product')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'products', 'error')}</span>
				</div>
			</div>

