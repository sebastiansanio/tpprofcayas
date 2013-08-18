<%@ page import="stakeholder.Customer" %>

<ul class="one-to-many">
	<g:each in="${productInstance?.codePerCustomer?}" var="c">
	    <li><g:link controller="codePerCustomer" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
	</g:each>
	<li class="add">
		<g:link controller="codePerCustomer" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'codePerCustomer.label', default: 'CodePerCustomer')])}</g:link>
	</li>
</ul>

<table class="table table-condensed">
	<thead>
		<th> <g:message code="customer.label" default="Customer"/> </th>
		<th> <g:message code="product.customerCode.label" default="Code"/> </th> 
	</thead>
	<tbody id="customerPerCodeTable">
		<g:each var="codeCustomer" in="${productInstance?.codePerCustomer?}" status="i">
			<tr>
				<td>
					<g:select name="codePerCustomer[${i}].customer" from="${Customer.list()}" optionKey="id" value="${codeCustomer.customer?.id}" class="many-to-one"/>					
				</td>
				<td>
					<g:textField name="codePerCustomer[${i}].code" value="${codeCustomer.code}"/>
				</td>
			</tr>
		</g:each>		
	</tbody>
</table>

			

<a role="button" class="btn btn-primary" id="addCustomerCode"> ${message(code: 'default.add.label', args: [message(code: 'codePerCustomer.label', default: 'CodePerCustomer')])}</a>


<script>

var customers = new Array();

$("document").ready( function(){

	var customers = new Array();
	var rows = 0;
	
	//cargo los clientes
	<%
		Customer.findAll().each
		{
			def option = '<option value="'+ it.id +'"> ' + it + ' </option>'
			out.println(""" customers.push('${option}'); """)
		}	
	%>

	$("#addCustomerCode").click( function() {

		var selectNode = "<select name='codePerCustomer[" +rows+ "].customer'>" + customers + "</select>";
		var textNode = "<input type='text' name='codePerCustomer[" +rows+ "].code'>"
		var newNode = "<tr>\
			<td> " + selectNode + "	</td> \
			<td> " + textNode + "</td> \
			</tr>"
		$("#customerPerCodeTable").append(newNode);

		rows++;
	});
	
});
</script>