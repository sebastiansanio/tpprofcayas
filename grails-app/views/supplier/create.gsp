<%@ page import="stakeholder.Supplier" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-supplier" class="first">

	<g:hasErrors bean="${supplierInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${supplierInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

	<g:render template="/_stakeholder/contactDeleteModal" model="['stakeholderInstance':supplierInstance]"></g:render>	
	<g:render template="../priceList/priceListDeleteModal" model="['stackeholder':supplierInstance]"></g:render>	
</section>
		
</body>

</html>
