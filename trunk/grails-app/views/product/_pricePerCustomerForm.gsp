<%@ page import="stakeholder.Customer" %>

<table class="table table-condensed">
	<thead>
		<th> <g:message code="customer.label" default="Customer"/> </th>
		<th> <g:message code="product.pricePerUnit.label" default="Price Per Unit"/> </th>
		<th> </th> 
	</thead>
	<tbody id="customerPerPriceTable">
		<g:each var="priceCustomer" in="${productInstance?.pricePerCustomer?}" status="i">
			<tr>
				<td>
					<g:select name="pricePerCustomer[${i}].customer.id" from="${Customer.list()}" optionKey="id" value="${priceCustomer.customer?.id}" class="many-to-one"/>					
				</td>
				<td>
					<g:field type="number" name="pricePerCustomer[${i}].price" step="0.0001" min="0.0000" value="${priceCustomer.price}"/>
					
				</td>
				<td>
					<g:link role="button" class="btn btn-primary" action="deletePricePerCustomer" params="['productId': productInstance?.id, 'pricePerCustomerId': priceCustomer.id ]" onclick="return confirm('${message(code:'default.button.delete.confirm.message', default:'Are you sure?') }');"><i class='icon-trash'></i></g:link>
					
				</td>
			</tr>
		</g:each>		
	</tbody>
</table>

			

<a role="button" class="btn btn-primary" id="addCustomerPrice"> ${message(code: 'default.add.label', args: [message(code: 'pricePerCustomer.label', default: 'Price Per Customer')])}</a>