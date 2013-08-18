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
					<g:link role="button" class="btn btn-primary" action="deleteCodePerCustomer" params="['productId': productInstance?.id, 'codePerCustomerId': codeCustomer.id ]"><i class='icon-trash'></i></g:link>
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
	var rows = ${productInstance?.codePerCustomer?.size()} + 0 ;
	
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
		return "codePerCustomer[" + nro + "].customer.id";
	};

	var nameTextFunc = function(nro) {
		return "codePerCustomer[" + nro + "].code";
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

			hermano.css("background", "#ff0000");
			hermano.find("select").attr("name", nameSelectFunc(i));
			hermano.find("input").attr("name", nameTextFunc(i));
			hermano.find("a").attr("id", idBtnDelFunc(i));
		}

		nodo.remove();		
	};
	
	$("#addCustomerCode").click( function() {

		var idBtnDel = idBtnDelFunc(rows);
		var selectNode = "<select name='"+ nameSelectFunc(rows) +"'>" + customers + "</select>";
		var textNode = "<input type='text' name='"+ nameTextFunc(rows) +"'>"
		var deleteNode = "<a role='button' class='btn btn-primary' id='" +idBtnDel+ "'> <i class='icon-trash'></i> </a>"
			
		var newNode = "<tr>\
			<td> " + selectNode + "	</td> \
			<td> " + textNode + "</td> \
			<td> " + deleteNode +"</td> \
			</tr>"
		$("#customerPerCodeTable").append(newNode);

		$("#"+idBtnDel).click( function() {
			delNode(this);
		} );
		
		rows++;
	});
	
});
</script>