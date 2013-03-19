<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>
<%@ page import="wish.LoadUnit" %>
<%@ page import="login.User" %>
<%@ page import="product.Product" %>


<script type="text/javascript">

	var loadUnitCount = ${wishInstance?.loadUnits?.size()} + 0;
	var usuarios = new Array(),
		productos = new Array(),
		usuario,
		producto;

	<%
	User.findAll().each
	{
		out.println(""" usuario = new Object(); """)
		out.println(""" usuario.id = '${it.id}'; """)
		out.println(""" usuario.nombre = '${it}'; """)
		out.println(""" usuarios.push(usuario); """)
		
	}	
	%>

	<%
	Product.findAll().each
	{
		out.println(""" producto = new Object(); """)
		out.println(""" producto.id = '${it.id}'; """)
		out.println(""" producto.nombre = '${it}'; """)
		out.println(""" productos.push(producto); """)
		
	}	
	%>
</script>
<script type="text/javascript" src="${resource(dir:'js', file:'loadUnitFunc.js')}"> </script>	


<table class="table table-hover table-condensed">
	<thead>
 		<tr>
        	<th>${message(code:'loadUnit.cartonPrintingInfoSentDate.label')}</th>
        	<th>${message(code:'loadUnit.cartonPrintingInfoSentUser.label')}</th>
        	<th>${message(code:'loadUnit.product.label')}</th>
        	<th>${message(code:'loadUnit.quantity.label')}</th>
        	<th>${message(code:'loadUnit.unitPrice.label')}</th>
        	<th></th>
        </tr>
    </thead>
	<tbody id="loadUnit-table">
	<g:each var="loadUnitInstance" in="${wishInstance?.loadUnits}" status="i">
		<tr>
			<td>	
				<bs:datePicker name="loadUnits[${i}].cartonPrintingInfoSentDate" precision="day"  value="${loadUnitInstance?.cartonPrintingInfoSentDate}" class="span2" />
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'cartonPrintingInfoSentDate', 'error')}</span>
			</td>

			<td>
				<g:select id="cartonPrintingInfoSentUser" name="loadUnits[${i}].cartonPrintingInfoSentUser.id" from="${login.User.list()}" optionKey="id" value="${loadUnitInstance?.cartonPrintingInfoSentUser?.id}" noSelection="${[null:'']}" class="many-to-one"/>
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'cartonPrintingInfoSentUser', 'error')}</span>
			</td>
			
			<td>
				<g:select id="loadUnits[${i}].product" name="loadUnits[${i}].product.id" from="${product.Product.list()}" optionKey="id" required="" value="${loadUnitInstance?.product?.id}" class="many-to-one"/>
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'product', 'error')}</span>
			</td>

			<td>
				<g:field type="number" class="span2" name="loadUnits[${i}].quantity" step="any" required="" value="${loadUnitInstance.quantity}"/>
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'quantity', 'error')}</span>
			</td>

			<td>
				<g:field type="number" class="span2" name="loadUnits[${i}].unitPrice" step="any" value="${loadUnitInstance.unitPrice}"/>
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'unitPrice', 'error')}</span>
			</td>
			
			<td>
				<a role="button" class="btn btn-primary" id="btnDel-unit-${i}"><i class="icon-trash"></i></a>
			</td>
		</tr>
	</g:each>

</tbody>
</table>

<input type="button" class="btn btn-primary" value="${message(code:'wish.loadUnit.add')}"  id="btnLoadUnit" />