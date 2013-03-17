<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>
<%@ page import="wish.LoadUnit" %>
<%@ page import="login.User" %>
<%@ page import="product.Product" %>


<script type="text/javascript">

	var loadUnitCount = ${wishInstance?.loadUnits?.size()} + 0;

	function addLoadUnit(){
		var htmlId = "loadUnit" + loadUnitCount;
		
		var templateHtml = "<tr>";	

		templateHtml += "<td>";
		templateHtml += "<input id='"+loadUnitCount+"cartonPrintingInfoSentDate' name='loadUnits["+loadUnitCount+"].cartonPrintingInfoSentDate' type='text' class='datepicker' data-date-format='dd/mm/yyyy' />";
		templateHtml += "</td>";

		templateHtml += "<td>";
		templateHtml += "<select id='loadUnits["+loadUnitCount+"].cartonPrintingInfoSentUser' name='loadUnits["+loadUnitCount+"].cartonPrintingInfoSentUser.id'>";
		<%
		User.findAll().each{
			out.println(""" templateHtml += "<option value='${it.id}'>${it}</option>" """)
			
		}		
		%>
		templateHtml += "</select>";
		templateHtml += "</td>";

		templateHtml += "<td>";
		templateHtml += "<select id='loadUnits["+loadUnitCount+"].product' name='loadUnits["+loadUnitCount+"].product.id'>";
		<%
		Product.findAll().each{
			out.println(""" templateHtml += "<option value='${it.id}'>${it}</option>" """)
			
		}
		
		%>
		templateHtml += "</select>";
		templateHtml += "</td>";		

		templateHtml += "<td>";
		templateHtml += "<input type='number' step='any' id='loadUnits["+loadUnitCount+"].quantity' name='loadUnits["+loadUnitCount+"].quantity' />";
		templateHtml += "</td>";

		templateHtml += "<td>";
		templateHtml += "<input type='number' step='any' id='loadUnits["+loadUnitCount+"].unitPrice' name='loadUnits["+loadUnitCount+"].unitPrice' />";
		templateHtml += "</td>";
		
		
		templateHtml += "</tr>";
		$("#loadUnit-table").append(templateHtml);		
		
		$("#"+loadUnitCount+"cartonPrintingInfoSentDate").datepicker({
			format: 'dd/mm/yyyy',
			
		});
		loadUnitCount++;
				
	}

</script>

<div class="row-fluid">

<table class="table table-hover table-condensed">
	<thead>
 		<tr>
        	<th>${message(code:'loadUnit.cartonPrintingInfoSentDate.label')}</th>
        	<th>${message(code:'loadUnit.cartonPrintingInfoSentUser.label')}</th>
        	<th>${message(code:'loadUnit.product.label')}</th>
        	<th>${message(code:'loadUnit.quantity.label')}</th>
        	<th>${message(code:'loadUnit.unitPrice.label')}</th>
        </tr>
    </thead>
	<tbody id="loadUnit-table">
	<g:each var="loadUnitInstance" in="${wishInstance?.loadUnits}" status="i">
		<tr>
			<td>	
				<bs:datePicker default="none" name="loadUnits[${i}].cartonPrintingInfoSentDate" precision="day"  value="${loadUnitInstance?.cartonPrintingInfoSentDate}"  />
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
				<g:field type="number" name="loadUnits[${i}].quantity" step="any" required="" value="${loadUnitInstance.quantity}"/>
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'quantity', 'error')}</span>
			</td>

			<td>
				<g:field type="number" name="loadUnits[${i}].unitPrice" step="any" value="${loadUnitInstance.unitPrice}"/>
				<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'unitPrice', 'error')}</span>
			</td>
		</tr>
	</g:each>

</tbody>
</table>

</div>

<input type="button" class="btn btn-primary" value="${message(code:'wish.loadUnit.add')}" onClick="addLoadUnit();" />