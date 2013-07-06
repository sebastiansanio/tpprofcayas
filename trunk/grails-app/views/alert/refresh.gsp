<%@ page import="report.Report" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alert.label', default: 'Alert')}" />
	<title><g:message code="default.refresh.label" args="[entityName]" /></title>
</head>

<body>
	
<g:form action="doRefresh">
	
	<g:submitButton class="btn" name="${message(code:'alert.refreshAlerts.label') }"/>

</g:form>

</body>

</html>
