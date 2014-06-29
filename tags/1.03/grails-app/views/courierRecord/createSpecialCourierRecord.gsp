<%@ page import="courier.SpecialCourierRecord" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'specialCourierRecord.label', default: 'SpecialCourierRecord')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-specialCourierRecord" class="first">

	<g:hasErrors bean="${specialCourierRecordInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${specialCourierRecordInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="saveSpecialCourierRecord" >
		<fieldset class="form">
			<g:render template="formSpecialCourierRecord"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
