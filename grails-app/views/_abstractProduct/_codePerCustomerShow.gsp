<tr class="prop">
	<td valign="top" class="name" colspan="2" >
					
	<g:message code="product.codePerCustomer.label" default="Code Per Customer" />
	
	<g:if test="${productInstance?.codePerCustomer?.size() != 0}">
		<table class="table">
			<thead>
				<tr>
					<th> <g:message code="customer.label" default="Customer"/> </th>
					<th> <g:message code="product.customerCode.label" default="Code"/> </th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${productInstance?.codePerCustomer}" var="c">
					<tr>
						<td> ${c.customer} </td>
						<td> ${c.code} </td>
					</tr>
				</g:each>
				
			</tbody>
		</table>
	</g:if>
	</td>
	
</tr>