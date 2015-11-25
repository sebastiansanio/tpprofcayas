<%@ page import="wish.ProductWish" %>

<div class="row-fluid">
<div class="span6">
<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'customer', 'error')} required">
	<label for="customer" class="control-label"><g:message code="productWish.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:select disabled="${productWishInstance?.customer && productWishInstance.id}" id="customer" name="customer.id" from="${stakeholder.Customer.list()}" optionKey="id" required="" value="${productWishInstance?.customer?.id}" class="many-to-one"/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'customer', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'deliveryDate', 'error')} required">
	<label for="deliveryDate" class="control-label"><g:message code="productWish.deliveryDate.label" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="deliveryDate" precision="day"  value="${productWishInstance?.deliveryDate}"  />
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'deliveryDate', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate" class="control-label"><g:message code="productWish.arrivalDate.label" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="arrivalDate" precision="day"  value="${productWishInstance?.arrivalDate}"  />
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'arrivalDate', 'error')}</span>
	</div>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'hasAdvancedPayment', 'error')} ">
	<label for="hasAdvancedPayment" class="control-label"><g:message code="productWish.hasAdvancedPayment.label"  /></label>
	<div class="controls">
		<bs:checkBox name="hasAdvancedPayment" value="${productWishInstance?.hasAdvancedPayment}" />
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'hasAdvancedPayment', 'error')}</span>
	</div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'currencyExchangeInformation', 'error')} ">
	<label for="currencyExchangeInformation" class="control-label"><g:message code="productWish.currencyExchangeInformation.label" /></label>
	<div class="controls">
		<g:textField name="currencyExchangeInformation" value="${productWishInstance?.currencyExchangeInformation}"/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'currencyExchangeInformation', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'freight', 'error')} ">
	<label for="freight" class="control-label"><g:message code="productWish.freight.label"  /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:field id="moneyBalance" type="number" name="freight" step="any" value="${productWishInstance.freight}" required=""/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'freight', 'error')}</span>
	</div>
</div>

</div>
<div class="span6">
<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'countryOfOrigin', 'error')} ">
	<label for="countryOfOrigin" class="control-label"><g:message code="productWish.countryOfOrigin.label" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="countryOfOrigin" name="countryOfOrigin.id" from="${modal.Country.list()}" optionKey="id" value="${productWishInstance?.countryOfOrigin?.id}" class="many-to-one" noSelection="['null': '']" required=""/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'countryOfOrigin', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'countryOfProcedence', 'error')} ">
	<label for="countryOfProcedence" class="control-label"><g:message code="productWish.countryOfProcedence.label" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="countryOfProcedence" name="countryOfProcedence.id" from="${modal.Country.list()}" optionKey="id" value="${productWishInstance?.countryOfProcedence?.id}" class="many-to-one" noSelection="['null': '']" required=""/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'countryOfProcedence', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'priceCondition', 'error')} ">
	<label for="priceCondition" class="control-label"><g:message code="productWish.priceCondition.label" /></label>
	<div class="controls">
		<g:select id="priceCondition" name="priceCondition.id" from="${modal.PriceCondition.list()}" optionKey="id" value="${productWishInstance?.priceCondition?.id}" class="many-to-one" noSelection="['null': '']"/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'priceCondition', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'shippingMark', 'error')} ">
	<label for="shippingMark" class="control-label"><g:message code="productWish.shippingMark.label"  /></label>
	<div class="controls">
		<g:select id="shippingMark" name="shippingMark.id" from="${modal.ShippingMark.list()}" optionKey="id" value="${productWishInstance?.shippingMark?.id}" class="many-to-one" noSelection="['null': '']"/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'shippingMark', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: productWishInstance, field: 'notes', 'error')} ">
	<label for="notes" class="control-label"><g:message code="productWish.notes.label" /></label>
	<div class="controls">
		<g:textArea rows="5" name="notes" value="${productWishInstance?.notes}"/>
		<span class="help-inline">${hasErrors(bean: productWishInstance, field: 'notes', 'error')}</span>
	</div>
</div>
</div>
</div>


<g:if test="${productWishInstance?.customer && productWishInstance.id}">

<g:set var="products" value="${product.PricePerCustomer.findAllByCustomer(productWishInstance?.customer)*.product}" />


<h4><g:message code="productWish.items.label" /></h4>
<div id="items" class="table-responsive">
	<table class="table table-condensed table-bordered">
		<thead>
			<tr>
				<th>${message(code: 'productWishItem.product.label')}</th>
				<th>${message(code: 'productWishItem.unitPrice.label')}</th>
				<th>${message(code: 'productWishItem.quantity.label')}</th>
				<th>${message(code: 'productWishItem.total.label')}</th>
				<th>${message(code: 'productWishItem.customerPrice.label')}</th>
			</tr>
		</thead>
		<tbody id="items-table">
			<g:each var="productWishItem" in="${productWishInstance?.items}" status="i">
				<tr class="form-inline" id="items-${i}">
					<td class="td-intableform"><g:select onchange="productChanged('${i}');" class="input-medium form-control" id="product-${i}" name="items[${i}].product.id" from="${products}" optionKey="id" required="" value="${productWishItem.product.id}"/></td>
					<td class="td-intableform"><g:field onchange="refreshRow('${i}');" type="text" class="input-medium form-control numberinput field-unitPrice" id="unitPrice-${i}" name="items[${i}].unitPrice" value="${productWishItem.unitPrice}" required=""/></td>
					<td class="td-intableform"><g:field onchange="refreshRow('${i}');" type="text" class="input-medium form-control numberinput field-quantity" id="quantity-${i}" name="items[${i}].quantity" value="${productWishItem.quantity}" required=""/></td>
					<td class="td-intableform"><g:field disabled="disabled" type="text" class="input-medium form-control field-total" id="total-${i}" name="items[${i}].total" value="${productWishItem.total}" /></td>
					<td class="td-intableform"><g:field disabled="disabled" type="text" class="input-medium form-control field-calculatedPrice" id="calculatedPrice-${i}" name="items[${i}].calculatedPrice" value="${productWishItem.product.calculateCustomerPrice(productWishInstance?.customer)}" /></td>
					<td><button type="button" class="btn btn-danger deleteButton" onclick="$('#items-${i}').remove();"><i class="icon-trash"></i></button></td>
				</tr>
			</g:each>
		</tbody>
	</table>
	
</div>
<button type="button" class="btn btn-default" onclick="addItem();" >${message(code:'productWish.add.button') }</button>


<div class="hide" >

<table>
	<tr class="form-inline" id="item-model">
		<td class="td-intableform"><g:select disabled="disabled" class="input-medium form-control" id="product-xyz" name="items[xyz].product.id" from="${products}" optionKey="id" required="" value=""/></td>
		<td class="td-intableform"><g:field type="text" disabled="disabled" class="input-medium form-control numberinput field-unitPrice" id="unitPrice-xyz" name="items[xyz].unitPrice" value="" required=""/></td>
		<td class="td-intableform"><g:field type="text" disabled="disabled" class="input-medium form-control numberinput field-quantity" id="quantity-xyz" name="items[xyz].quantity" value="" required=""/></td>
		<td class="td-intableform"><g:field type="text" disabled="disabled" class="input-medium form-control numberinput field-total disabled" id="total-xyz" name="items[xyz].total" value="" /></td>
		<td class="td-intableform"><g:field type="text" disabled="disabled" class="input-medium form-control numberinput field-calculatedPrice disabled" id="calculatedPrice-xyz" name="items[xyz].calculatedPrice" value="" /></td>
		<td><button type="button" class="btn btn-danger deleteButton" ><i class="icon-trash"></i></button></td>
	</tr>
</table>

</div>




<script>
var productsCustomerPriceMap = new Array();
var productsCalculatedPriceMap = new Array();
<%
	products.each{
		out.println(""" productsCalculatedPriceMap[${it.id}] = ${it.calculateCustomerPrice(productWishInstance?.customer)} ;""")
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
	$(".disabled").prop("disabled", true);
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