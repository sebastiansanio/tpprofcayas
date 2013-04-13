<div id="modalDeleteContact" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalDeleteContactLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalDeleteContact">${message(code: 'contact.delete.label', default: 'Delete contact')}</h3>
	</div>

	<div class="modal-body">
         <p>${message(code: 'contact.deleteMessage.label', default: "Are you sure?")}</p>
	</div>

	<div class="modal-footer">
		<g:form controller="stakeholder" action="deleteContact" params="[idStakeholder: stakeholderInstance.id]">		
			<button class="btn" type="reset" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label" default="Cancel"/></button>
			<g:hiddenField name="nroContactDelete" id="nroContactDelete"/>
			<span class="button"><g:actionSubmit class="btn btn-danger" action="deleteContact" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>
		</g:form>
	</div>
	
</div>