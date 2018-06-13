<%@ page import="stakeholder.Customer" %>

<table class="table table-condensed">
	<thead>
		<th> <g:message code="customer.label" default="Customer"/> </th>
		<th> <g:message code="product.customerCode.label" default="Code"/> </th>
		<th> </th> 
	</thead>
	<tbody id="customerPerCodeTable">
		<g:each var="codeCustomer" in="${productInstance?.codePerCustomer?}" status="i">
			<tr>
			
				<td>
					<g:select name="codePerCustomer[${i}].customer.id" from="${Customer.list()}" optionKey="id" value="${codeCustomer.customer?.id}" class="many-to-one"/>					
				</td>
				<td>
					<g:textField name="codePerCustomer[${i}].code" value="${codeCustomer.code}"/>
				</td>
				<td>
					<g:if test="${!codeCustomer.id}">
						<a role="button" id="codeBtnDelTempNode-${i}" class="btn btn-primary deleteTempCode"><i class='icon-trash'></i></a>
					</g:if>
					<g:else>
						<g:link role="button" class="btn btn-primary" action="deleteCodePerCustomer" params="['productId': productInstance?.id, 'codePerCustomerId': codeCustomer.id ]" onclick="return confirm('${message( code: 'default.button.delete.confirm.message', default:'Are you sure?')}');"><i class='icon-trash'></i></g:link>
					</g:else>
				</td>
			</tr>
		</g:each>		
	</tbody>
</table>

<a role="button" class="btn btn-primary" id="addCustomerCode"> ${message(code: 'default.add.label', args: [message(code: 'codePerCustomer.label', default: 'Code Per Customer')])}</a>
