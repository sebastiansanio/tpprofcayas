<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.import.label" args="[entityName]" /></title>
</head>

<body>
	

<h4> <g:message code="default.import.label" default="Import" args="[entityName]"/> </h4>

<g:form action="importWishes" class="form-horizontal" enctype="multipart/form-data">
<g:field type="file" id="importFile" name="importFile" required="" />
<div class="form-actions">
<g:submitButton name="importWishes" class="btn btn-primary" value="${message(code: 'default.button.import.label', default: 'Import')}" />
</div>
</g:form>


</body>

</html>
