<%@ page import="product.PriceList" %>

<h5><g:message code="supplier.add.priceList.label" default="Price List" /></h5>

<div class="row-fluid">
	<div class="span6">
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'list', 'error')} ">
			<label for="name" class="control-label"><g:message code="priceList.name.label" default="Name" /></label>
			<div id="container-price-list" class="controls row-input">
				<g:each var="list" in="${supplierInstance?.priceLists?.sort{it.name}}" status="i">
					<div class="input-button ">
						<g:textField class="list-name" name="priceLists[${i}].name" value="${list?.name}" requeried="" data-index="0"/>
						<g:if test="${!list.id}">
							<a role="button" class="btn btn-small btn-primary btnDel-priceList"><i class="icon-trash"></i></a>
						</g:if>
					    <g:else>							
							<g:hiddenField name="supplier.priceLists[${i}].id" value="${list?.id}" />
							<a href="#modalDeleteList" role="button" class="btn btn-small btn-primary btn-modal-delete-list" data-index="${list?.id}" data-toggle="modal"> <i class="icon-trash"></i> </a>
						</g:else>
					</div>
				</g:each>
			</div>
		</div>
	</div>
</div>

<a id="addPriceList" role="button" class="btn btn-small btn-primary" id="btnAdd-contact"> ${message(code: 'supplier.add.priceList.label', default: 'Add price list')}</a>
