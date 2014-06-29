<%@ page import="wish.Wish" %>

<!-- Modal para reemplazar un arhivo de un documento de un pedido-->

<div id="modalReplaceDocument" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalReplaceDocumentLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalReplaceDocumentLabel">${message(code: 'document.replacefile.label', default: 'Replace document')}</h3>
	</div>

	<div class="modal-body">
         <p>${message(code: 'document.replacefilemessage.label', default: "Are you sure?")}</p>
	</div>

	<div class="modal-footer">
		<a href="#docPhases1" class="btn" id="canDoc"><g:message code="default.button.cancel.label" default="Cancel"/></a>
		<a href="#docPhases1" class="btn btn-danger" id="repDoc"> <g:message code="default.button.replace.label" default="Replace"/></a>
	</div>
</div>

<script>
	$("#canDoc").click(function() 
	{
        $("#modalReplaceDocument").modal('hide');
	});

	$("#repDoc").click(function() 
	{
        $("#modalReplaceDocument").modal('hide');
	});
	
</script>