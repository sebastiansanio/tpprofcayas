<div id="modalDeleteList" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalDeleteListLabel" aria-hidden="true">

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="modalDeleteList">${message(code: 'priceList.delete.label', default: 'Delete price list')}</h3>
    </div>

    <div class="modal-body">
         <p>${message(code: 'contact.deleteMessage.label', default: "Are you sure?")}</p>
    </div>

    <div class="modal-footer">
        <g:form action="deletePriceList" params="[idSupplier: supplierInstance.id]">        
            <button class="btn" type="reset" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label" default="Cancel"/></button>
            <g:hiddenField name="nroPriceListDelete" id="nroPriceListDelete"/>
            <span class="button"><g:actionSubmit class="btn btn-danger" action="deletePriceList" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>
        </g:form>
    </div>
    
</div>