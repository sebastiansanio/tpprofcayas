<%@ page import="stakeholder.Customer" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-customer" class="first">

	<g:hasErrors bean="${customerInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${customerInstance}" as="list" />
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
	
	<g:render template="/_stakeholder/contactDeleteModal" model="['stakeholderInstance':customerInstance]"></g:render>
	<g:render template="/priceList/priceListDeleteModal" model="['stackeholder':customerInstance]"></g:render>	
</section>
		
</body>

</html>
