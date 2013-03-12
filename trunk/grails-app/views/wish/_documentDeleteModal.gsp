<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>

<!-- Modal para borrar un documento de un pedido-->

<div id="modalDeleteDocument" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalDeleteDocumentLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalDeleteDocumentLabel">${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</h3>
	</div>

	<div class="modal-body">
         <p>${message(code: 'wish.deleteDocumentMessage.label', default: "Are you sure?")}</p>
	</div>

	<div class="modal-footer">
		<g:form action="deleteDocument" params="[idWish: wishInstance.id]">		
			<button class="btn" type="reset" data-dismiss="modal"><g:message code="default.button.cancel.label" default="Cancel"/></button>
			<g:hiddenField name="nroDocumentDelete" id="nroCurrentDocumentDelete"/>
			<button class="btn btn-danger" id="delDoc"> <g:message code="default.button.delete.label" default="Delete"/></button>
		</g:form>
	</div>
</div>

<script type="text/javascript">
$("#delDoc").click(function()
{
	//porq de la otra manera llamaba al DeleteDocument y no al que le ponía en forma dinámica.
    $("#modalDeleteDocument").modal('show');    
});	
</script>