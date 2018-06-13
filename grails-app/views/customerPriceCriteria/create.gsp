<%@ page import="prices.CustomerPriceCriteria" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-customerPriceCriteria" class="first">

	<g:hasErrors bean="${customerPriceCriteriaInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${customerPriceCriteriaInstance}" as="list" />
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
	
</section>
		
</body>

</html>
