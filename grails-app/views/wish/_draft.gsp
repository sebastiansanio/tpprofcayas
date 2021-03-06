<%@ page import="wish.Wish" %>
			
<script type="text/javascript">
	var cantDraft = ${wishInstance?.docDraftToBeApprovedBeforeDelivery?.size()} + 0;
</script>
<script type="text/javascript" src="${resource(dir:'js', file:'draftFunc.js')}"> </script>	
				
	<div id="draftDoc" class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')} ">
 		<table class="table table-hover">
 			<thead>
 				<tr>
                   	<th>${message(code: 'draft.description.label', default: 'Description')}</th>
                   	<th></th>
                   	<th></th>
                   	
                 </tr>
            </thead>
 			<tbody id="draft-table">
				<g:each var="draft" in="${wishInstance?.docDraftToBeApprovedBeforeDelivery}" status="i">
					<tr>

						<td> <g:textField name="docDraftToBeApprovedBeforeDelivery[${i}].description" value="${draft?.description}" id="text-draft-${i}"/></td>

						<g:if test="${!draft?.id}">
							<td>
								<p> <input type="file" id="btnAdd-draft-${i}" name="docDraftToBeApprovedBeforeDelivery[${i}].draft"> </p>
								<p> <span class="help-inline alert alert-error"> <strong>x</strong> ${message(code: 'draft.noFileSelected.label', default: 'No file selected')}</span> </p>
							</td>	
														
							<td> <a role="button" class="btn btn-small btn-primary btnDel-draft-temp" id="btnDel-draft-${i}"><i class="icon-trash"></i></a></td>

                  		</g:if>
                  		<g:else>
							<td> <a href="#modalReplaceFile" role="button" class="btn btn-small btn-primary btnRep-draft" id="btnRep-draft-${i}"> ${message(code: 'default.button.replace.label', default: 'Replace file')}</a> </td>
							
							<td> <a href="#modalDeleteDocument" role="button" class="btn btn-small btn-primary btnDel-draft" id="btnDel-draft-${i}"> <i class="icon-trash"></i> </a></td>

                  		</g:else>
					</tr>
				</g:each>				
            </tbody>
 		</table>
    </div>
    

<a role="button" class="btn btn-primary add-draft">${message(code: 'draft.add.label', default: 'Add draft')}</a>

<!--  modal para reemplazar archivos -->
<g:render template="draftReplaceModal"></g:render>