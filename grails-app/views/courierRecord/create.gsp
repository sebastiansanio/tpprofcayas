<%@ page import="courier.DocumentsCourierRecord" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'documentsCourierRecord.label', default: 'DocumentsCourierRecord')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<p><i class="icon-plus"></i><g:link action="createDocumentsCourierRecord">${message(code:'default.create.label',args:[message(code:'documentsCourierRecord.label',default:'Documents Courier Record')])} </g:link></p>

	<p><i class="icon-plus"></i><g:link action="createSpecialCourierRecord"> ${message(code:'default.create.label',args:[message(code:'specialCourierRecord.label',default:'Special Courier Record')])}  </g:link></p>

		
</body>

</html>
