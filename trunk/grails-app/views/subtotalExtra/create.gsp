<%@ page import="wish.SubtotalExtra" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subtotalExtra.label', default: 'SubtotalExtra')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'aluminum.css')}" />
	<g:javascript src="extras.js" />	
</head>

<body>

<section id="create-subtotalExtra" class="first">

	<g:hasErrors bean="${subtotalExtraInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${subtotalExtraInstance}" as="list" />
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
