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
					<g:link role="button" class="btn btn-primary" action="deletePricePerCustomer" params="['productId': productInstance?.id, 'pricePerCustomerId': priceCustomer.id ]"><i class='icon-trash'></i></g:link>
				</td>
			</tr>
		</g:each>		
	</tbody>
</table>

			

<a role="button" class="btn btn-primary" id="addCustomerPrice"> ${message(code: 'default.add.label', args: [message(code: 'pricePerCustomer.label', default: 'CodePerCustomer')])}</a>


<script>

var customers = new Array();

$("document").ready( function(){

	var customers = new Array();
	var rows = ${productInstance?.pricePerCustomer?.size()} + 0 ;
	
	//cargo los clientes
	<%
		Customer.findAll().each
		{
			def option = '<option value="'+ it.id +'"> ' + it + ' </option>'
			out.println(""" customers.push('${option}'); """)
		}	
	%>

	var idBtnDelFunc = function(nro) {
		return "btnDelTempNode-"+ nro;
	};

	var nameSelectFunc = function(nro) {
		return "pricePerCustomer[" + nro + "].customer.id";
	};

	var nameNumericFunc = function(nro) {
		return "pricePerCustomer[" + nro + "].price";
	};

	var delNode = function(objeto) 
	{
		var nroRef = parseInt(objeto.id.split("-")[1]); 
		var nodo = $(objeto).closest("tr");
		rows--;

		
		var hermano = nodo;

		for (var i = nroRef; i < rows; i++)
		{
			hermano = hermano.next();

			hermano.find("select").attr("name", nameSelectFunc(i));
			hermano.find("input").attr("name", nameNumericFunc(i));
			hermano.find("a").attr("id", idBtnDelFunc(i));
		}

		nodo.remove();		
	};
	
	$("#addCustomerPrice").click( function() {

		var idBtnDel = idBtnDelFunc(rows);
		var selectNode = "<select name='"+ nameSelectFunc(rows) +"'>" + customers + "</select>";
		var numericNode = "<input type='number' name='"+ nameNumericFunc(rows) +"' step='0.0001' min='0.0000' value='0.0000'>";
		var deleteNode = "<a role='button' class='btn btn-primary' id='" +idBtnDel+ "'> <i class='icon-trash'></i> </a>"

		var newNode = "<tr>\
			<td> " + selectNode + "	</td> \
			<td> " + numericNode + "</td> \
			<td> " + deleteNode +"</td> \
			</tr>"
		$("#customerPerPriceTable").append(newNode);

		$("#"+idBtnDel).click( function() {
			delNode(this);
		} );
		
		rows++;
	});
	
});
</script>