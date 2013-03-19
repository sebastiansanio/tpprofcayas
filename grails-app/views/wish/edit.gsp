<%@ page import="wish.Wish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
	
	<script type="text/javascript">
		var messageDeleteDraft = "${message(code: 'draft.delete.label', default: 'Delete draft')}";
		var cantDraft = ${wishInstance?.docDraftToBeApprovedBeforeDelivery?.size()} + 0;
	</script>
	<script type="text/javascript" src="${resource(dir:'js', file:'draftFunc.js')}"> </script>	
		
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'tableArticle.css')}" />
	
</head>

<body>

<section id="edit-wish" class="first">

	<g:hasErrors bean="${wishInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${wishInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" enctype="multipart/form-data">
		<g:hiddenField name="id" value="${wishInstance?.id}" />
		<g:hiddenField name="version" value="${wishInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

	<!-- lo agrego acá porq según documentación no se puede tener un form dentro de otro -->
	<g:render template="documentDeleteModal"></g:render>
	<g:render template="draftDeleteModal"></g:render>
	
</section>
			
</body>

</html>
