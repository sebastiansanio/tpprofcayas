<%@ page import="wish.LetterOfGuarantee" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
	<script type="text/javascript" src="${resource(dir:'js', file:'letterGuaranteeFunc.js')}"> </script>	
	
</head>

<body>

<section id="edit-letterOfGuarantee" class="first">

	<g:hasErrors bean="${letterOfGuaranteeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${letterOfGuaranteeInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${letterOfGuaranteeInstance?.id}" />
		<g:hiddenField name="version" value="${letterOfGuaranteeInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
<div id="linkNuevo">
	<g:link action="edit" params="[customer:'[id:'+letterOfGuaranteeInstance?.customer?.id+']', 'customer.id':letterOfGuaranteeInstance?.customer?.id, forwarder:'[id:'+letterOfGuaranteeInstance?.forwarder?.id+']', 'forwarder.id':letterOfGuaranteeInstance?.forwarder?.id, year:letterOfGuaranteeInstance?.year]"></g:link>
</div>

<div id="linkDelete">
	<g:link action="delete" params="[customer:'[id:'+letterOfGuaranteeInstance?.customer?.id+']', 'customer.id':letterOfGuaranteeInstance?.customer?.id, forwarder:'[id:'+letterOfGuaranteeInstance?.forwarder?.id+']', 'forwarder.id':letterOfGuaranteeInstance?.forwarder?.id, year:letterOfGuaranteeInstance?.year]"></g:link>
</div>

<script type="text/javascript">

$("document").ready( function() {

	<input type="submit" name="_action_delete" value="Eliminar" class="btn btn-danger">

	//para el delete
	var panelDelete = $("#DeleteModal").children(".modal-footer").children("form");

	var year = "<input type='hidden' name='year' value='"+2013+"' id='year'>"
	var idCustomer = "<input type='hidden' name='year' value='"+2013+"' id='year'>"
	var customer = "<input type='hidden' name='year' value='"+2013+"' id='year'>"
	var idForwarder = "<input type='hidden' name='year' value='"+2013+"' id='year'>"
	var forwarder = "<input type='hidden' name='year' value='"+2013+"' id='year'>"
	
	
	panelDelete.append(year);

	var panelDelete = $("#DeleteModal").find(".btn btn-danger");
	
	
	//alert("a");
});

</script>
</body>

</html>
