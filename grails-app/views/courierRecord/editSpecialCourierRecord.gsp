<%@ page import="courier.SpecialCourierRecord" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'specialCourierRecord.label', default: 'SpecialCourierRecord')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-specialCourierRecord" class="first">

	<g:hasErrors bean="${specialCourierRecordInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${specialCourierRecordInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${specialCourierRecordInstance?.id}" />
		<g:hiddenField name="version" value="${specialCourierRecordInstance?.version}" />
		<fieldset class="form">
			<g:render template="formSpecialCourierRecord"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
