<%@ page import="wish.ProductWish" %>


<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'customer', 'error')} required">
	<label for="customer" class="control-label"><g:message code="productWish.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:select disabled="${productWishInstance?.customer != null}" id="customer" name="customer.id" from="${stakeholder.Customer.list()}" optionKey="id" required="" value="${productWishInstance?.customer?.id}" class="many-to-one"/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'customer', 'error')}</span>
	</div>
</div>

<g:if test="${productWishInstance?.customer}">

<g:set var="products" value="${product.PricePerCustomer.findAllByCustomer(productWishInstance?.customer)*.product}" />


<h4><g:message code="productWish.items.label" /></h4>
<div id="items" class="table-responsive">
	<table class="table table-condensed table-bordered">
		<thead>
			<tr>
				<th>${message(code: 'productWishItem.product.label')}</th>
				<th>${message(code: 'productWishItem.unitPrice.label')}</th>
				<th>${message(code: 'productWishItem.quantity.label')}</th>
				<th>${message(code: 'productWishItem.calculatedPrice.label')}</th>
			</tr>
		</thead>
		<tbody id="items-table">
			<g:each var="productWishItem" in="${productWishInstance?.items}" status="i">
				<tr class="form-inline" id="items-${i}">
					<td class="td-intableform"><g:select onchange="refreshRow('${i}');" class="input-intableform form-control" id="product-${i}" name="items[${i}].product.id" from="${products}" optionKey="id" required="" value="${productWishItem.product.id}"/></td>
					<td class="td-intableform"><g:field onchange="refreshRow('${i}');" type="text" class="input-intableform form-control numberinput field-quantity" id="quantity-${i}" name="items[${i}].quantity" value="${productWishItem.quantity}" required=""/></td>
					<td class="td-intableform"><g:field onchange="refreshRow('${i}');" type="text" class="input-intableform form-control numberinput field-unitPrice" id="unitPrice-${i}" name="items[${i}].unitPrice" value="${productWishItem.unitPrice}" required=""/></td>
					<td class="td-intableform"><g:field disabled="disabled" type="text" class="input-intableform form-control field-total" name="items[${i}].total" id="total-${i}" value="${productWishItem.quantity.multiply(productWishItem.unitPrice).setScale(2)}" required=""/></td>
					<td><button type="button" class="btn btn-danger deleteButton" onclick="$('#items-${i}').remove();"><i class="icon-trash"></i></button></td>
				</tr>
			</g:each>
		</tbody>
	</table>
	
</div>
<button type="button" class="btn btn-default" onclick="addItem();" >Agregar item</button>


<div class="hide" >

<table>
	<tr class="form-inline" id="item-model">
		<td class="td-intableform"><g:select disabled="disabled" class="input-intableform form-control" id="product-xyz" name="items[xyz].product.id" from="${products}" optionKey="id" required="" value=""/></td>
		<td class="td-intableform"><g:field type="text" disabled="disabled" class="input-intableform form-control numberinput field-quantity" id="quantity-xyz" name="items[xyz].quantity" value="" required=""/></td>
		<td class="td-intableform"><g:field type="text" disabled="disabled" class="input-intableform form-control numberinput field-unitPrice" id="unitPrice-xyz" name="items[xyz].unitPrice" value="" required=""/></td>
		<td><button type="button" class="btn btn-danger deleteButton" ><i class="icon-trash"></i></button></td>
	</tr>
</table>

</div>




<script>
var productsMap = new Array();
<%
	products.each{
		out.println(""" productsMap[${it.id}] = ${it.calculateCustomerPrice(productWishInstance?.customer)} ;""")
	}	
%>


var itemsQuantity = ${productWishInstance?.items?.size()?:0};
	
function addItem(){
	$tmc = $("#item-model").clone();
	$tmc.attr('id', 'items-'+ itemsQuantity);
	$("input, select, textarea", $tmc).each(function(){
		$(this).attr('name',$(this).attr('name').replace('xyz',itemsQuantity));
		$(this).attr('id',$(this).attr('id').replace('xyz',itemsQuantity));		
		$(this).prop("disabled", false);
	});
	var currentItemQuantity = itemsQuantity;
	$(".numberinput", $tmc).change(function() {
		refreshTotal(currentItemQuantity);
	});
	$(".deleteButton", $tmc).click(function() {
		$('#items-'+currentItemQuantity).remove();
	});

	
	$tmc.appendTo("#items-table");
	itemsQuantity = itemsQuantity + 1;
}

function refreshTotal(idx){
	var total = safeParseFloat($('#amount-'+idx).val())+ safeParseFloat($('#iva-'+idx).val()) + safeParseFloat($('#iibb-'+idx).val()) + safeParseFloat($('#otherPerceptions-'+idx).val());
	$('#total-'+idx).val(total);
	refreshTotals();
}

function refreshTotals(){
	var amount = 0;
	

}

function safeParseFloat(inputString){
	var result = parseFloat(inputString);
	if(isNaN(result)){
		result = 0;
	}
	return result;
}

$(function() {
	refreshTotals();

});

</script>

</g:if>