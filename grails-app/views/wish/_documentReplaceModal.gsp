<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>

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
		<button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label" default="Cancel"/></button>
		<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" id="repDoc"> <g:message code="default.button.replace.label" default="Replace"/></button>
	</div>
</div>