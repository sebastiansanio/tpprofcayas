<%@ page import="stakeholder.Supplier" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-supplier" class="first">

	<g:hasErrors bean="${supplierInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${supplierInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${supplierInstance?.id}" />
		<g:hiddenField name="version" value="${supplierInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

	<g:render template="/_stakeholder/contactDeleteModal" model="['stakeholderInstance':supplierInstance]"></g:render>
	<g:render template="../priceList/priceListDeleteModal" model="['stackeholder':supplierInstance]"></g:render>

</section>
			
</body>

</html>
