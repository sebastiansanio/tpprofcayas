<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.import.label" args="[entityName]" /></title>
</head>

<body>

<g:if test="${flash.error != null}">
	<div class="alert alert-error">
		${flash.error}
	</div>
</g:if>


<h4> <g:message code="product.import.label" default="Import"/> </h4>

<g:form action="importProducts" class="form-horizontal" enctype="multipart/form-data">
<g:field type="file" id="importFile" name="importFile" required="" />

<p><a href="${resource(dir:'models',file: 'Productos-Modelo.xls')}">
${message(code:'default.downloadModel.label',default:'Download Model')}
</a></p>

<div class="form-actions">
<g:submitButton name="importProducts" class="btn btn-primary" value="${message(code: 'product.import.label', default: 'Import')}" />

</div>
</g:form>


</body>

</html>
