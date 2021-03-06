<%@ page import="wish.Wish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>	
</head>

<body>
	
<section id="create-wish" class="first">

	<g:hasErrors bean="${wishInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${wishInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" enctype="multipart/form-data">

		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
	<!-- lo agrego acá porq según documentación no se puede tener un form dentro de otro -->
	<g:render template="documentDeleteModal"></g:render>
	<g:render template="draftDeleteModal"></g:render>
	<g:render template="loadUnitsDeleteModal"></g:render>
	
</section>

</body>

</html>
