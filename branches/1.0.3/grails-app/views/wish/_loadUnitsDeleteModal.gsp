<%@ page import="wish.Wish" %>

<div id="modalDeleteUnit" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalDeleteUnitLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalDeleteUnitLabel">${message(code: 'loadUnit.delete.label', default: 'Delete load unit')}</h3>
	</div>

	<div class="modal-body">
         <p>${message(code: 'draft.deleteMessage.label', default: "Are you sure?")}</p>
	</div>

	<div class="modal-footer">
		<g:form action="deleteUnit" params="[idWish: wishInstance.id]">		
			<button class="btn" type="reset" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label" default="Cancel"/></button>
			<g:hiddenField name="nroUnitDelete" id="nroCurrentUnitDelete"/>
			<span class="button"><g:actionSubmit class="btn btn-danger" action="deleteUnit" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>
		</g:form>
	</div>
</div>