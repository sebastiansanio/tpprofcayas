<%@ page import="wish.Wish" %>
			
 <h5><g:message code="wish.docDraftToBeApprovedBeforeDelivery.label" default="Doc Draft To Be Approved Before Delivery"/></h5>
	<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')} ">
 		<table class="table table-hover">
 			<thead>
 				<tr>
                   	<th>${message(code: 'draft.description.label', default: 'Description')}</th>
                   	<th> </th>
                   	<th></th>
                   	
                 </tr>
            </thead>
 			<tbody>
				<g:each var="draft" in="${wishInstance?.docDraftToBeApprovedBeforeDelivery}" status="i">
					<tr>
						<td> <g:textField name="description" id="txt-draf-${i}"/> </td>
						
						<td>
	                  		<p><input type="file" id="btnAdd2-${i}" name="document"></p>
	                  		<p><a role="button" class="btn btn-small btn-primary btnRep" id="btnRep2-${i}"> ${message(code: 'document.replacefile.label', default: 'Replace file')}</a></p>							
						</td>
					
						<td><a href="#modalDeleteDocument" role="button" class="btn btn-small btn-primary" id="btnDel-draft-${i}"> ${message(code: 'wish.deleteDraft.label', default: 'Delete draft')}</a></td>
					</tr>
				</g:each>
            </tbody>
 		</table>
    </div>

	<span class="help-inline">${hasErrors(bean: wishInstance, field: 'docDraftToBeApprovedBeforeDelivery', 'error')}</span>
			
<!--  modal para reemplazar archivos de un documento -->
	<g:render template="documentReplaceModal"></g:render>
	
<script type="text/javascript">

</script>