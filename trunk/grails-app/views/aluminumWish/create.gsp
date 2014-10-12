<%@ page import="wish.AluminumWish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminumWish.label', default: 'AluminumWish')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-aluminumWish" class="first">

	<g:hasErrors bean="${aluminumWishInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${aluminumWishInstance}" as="list" />
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
	
	<div id="subwishForm" class="hidden subWish">
		<g:render template="subwishForm" model="['number': aluminumWishInstance?.subWish?.size()]"/>
	</div>
</section>
		
</body>

</html>
