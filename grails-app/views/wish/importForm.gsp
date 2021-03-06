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

<g:if test="${flash.error != null}">
	<div class="alert alert-error">
		${flash.error}
	</div>
</g:if>


<h4> <g:message code="wish.import.label" default="Import"/> </h4>




<g:form action="importWishes" class="form-horizontal" enctype="multipart/form-data">
<g:field type="file" id="importFile" name="importFile" required="" />

<p><a href="${resource(dir:'models',file: 'Pedidos-Modelo.xls')}">
${message(code:'default.downloadModel.label',default:'Download Model')}
</a></p>

<div class="form-actions">
<g:submitButton name="importWishes" class="btn btn-primary" value="${message(code: 'wish.import.label', default: 'Import')}" />

</div>
</g:form>


<h4> <g:message code="document.import.label" default="Import"/> </h4>

<g:form action="importDocuments" class="form-horizontal" enctype="multipart/form-data">
<g:field type="file" id="importFile" name="importFile" required="" />

<p><a href="${resource(dir:'models',file: 'Documentos-Modelo.xls')}">
${message(code:'default.downloadModel.label',default:'Download File Model')}
</a></p>

<div class="form-actions">

<g:submitButton name="importDocuments" class="btn btn-primary" value="${message(code: 'document.import.label', default: 'Import')}" />




</div>
</g:form>


</body>

</html>
