<%@ page import="wish.Wish" %>

<div id="modalReplaceDraft" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalReplaceDraftLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalReplaceDraftLabel">${message(code: 'draft.replacefile.label', default: 'Replace file')}</h3>
	</div>

	<div class="modal-body">
         <p>${message(code: 'draft.replacefilemessage.label', default: "Are you sure?")}</p>
	</div>

	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label" default="Cancel"/></button>
		<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" id="repDraft"> <g:message code="default.button.replace.label" default="Replace"/></button>
	</div>
</div>