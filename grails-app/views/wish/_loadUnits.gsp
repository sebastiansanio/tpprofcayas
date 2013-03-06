<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>
<%@ page import="wish.LoadUnit" %>
<%@ page import="login.User" %>
<%@ page import="product.Product" %>


<script type="text/javascript">

	var loadUnitCount = ${wishInstance?.loadUnits?.size()} + 0;

	function addLoadUnit(){
		var htmlId = "loadUnit" + loadUnitCount;
		
		var templateHtml = "<div class='row' id='" + htmlId + "' name='" + htmlId +"'>";	

		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='cartonPrintingInfoSentDate' class='control-label'>";
		templateHtml += "${message(code:'loadUnit.cartonPrintingInfoSentDate.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<input id='"+loadUnitCount+"cartonPrintingInfoSentDate' name='loadUnits["+loadUnitCount+"].cartonPrintingInfoSentDate' type='text' class='datepicker' data-date-format='dd/mm/yyyy' />";
		templateHtml += "</div>";
		templateHtml += "</div>";


		templateHtml += "<div class='control-group fieldcontain'>";
		templateHtml += "<label for='cartonPrintingInfoSentUser' class='control-label'>";
		templateHtml += "${message(code:'loadUnit.cartonPrintingInfoSentUser.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<select id='loadUnits["+loadUnitCount+"].cartonPrintingInfoSentUser' name='loadUnits["+loadUnitCount+"].cartonPrintingInfoSentUser.id'>";
		<%
		User.findAll().each{
			out.println(""" templateHtml += "<option value='${it.id}'>${it}</option>" """)
			
		}		
		%>
		templateHtml += "</select>";
		templateHtml += "</div>";
		templateHtml += "</div>";



		templateHtml += "<div class='control-group fieldcontain'>";
		templateHtml += "<label for='product' class='control-label'>";
		templateHtml += "${message(code:'loadUnit.product.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<select id='loadUnits["+loadUnitCount+"].product' name='loadUnits["+loadUnitCount+"].product.id'>";
		<%
		Product.findAll().each{
			out.println(""" templateHtml += "<option value='${it.id}'>${it}</option>" """)
			
		}
		
		%>
		templateHtml += "</select>";
		templateHtml += "</div>";
		templateHtml += "</div>";
		

		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='quantity' class='control-label'>";
		templateHtml += "${message(code:'loadUnit.quantity.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<input type='number' step='any' id='loadUnits["+loadUnitCount+"].quantity' name='loadUnits["+loadUnitCount+"].quantity' />";
		templateHtml += "</div>";
		templateHtml += "</div>";

		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='unitPrice' class='control-label'>";
		templateHtml += "${message(code:'loadUnit.unitPrice.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<input type='number' step='any' id='loadUnits["+loadUnitCount+"].unitPrice' name='loadUnits["+loadUnitCount+"].unitPrice' />";
		templateHtml += "</div>";
		templateHtml += "</div>";
		
		
		templateHtml += "</div>";
		$("#loadUnitsChildList").append(templateHtml);		
		
		$("#"+loadUnitCount+"cartonPrintingInfoSentDate").datepicker({
			format: 'dd/mm/yyyy',
			
		});
		loadUnitCount++;
				
	}

</script>

<div id="loadUnitsChildList">
	
	<g:each var="loadUnitInstance" in="${wishInstance?.loadUnits}" status="i">
	
			<div class="control-group fieldcontain ${hasErrors(bean: loadUnitInstance, field: 'cartonPrintingInfoSentDate', 'error')} required">
				<label for="cartonPrintingInfoSentDate" class="control-label"><g:message code="loadUnit.cartonPrintingInfoSentDate.label" default="Carton Printing Info Sent Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="loadUnits[${i}].cartonPrintingInfoSentDate" precision="day"  value="${loadUnitInstance?.cartonPrintingInfoSentDate}"  />
					<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'cartonPrintingInfoSentDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: loadUnitInstance, field: 'cartonPrintingInfoSentUser', 'error')} required">
				<label for="cartonPrintingInfoSentUser" class="control-label"><g:message code="loadUnit.cartonPrintingInfoSentUser.label" default="Carton Printing Info Sent User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="cartonPrintingInfoSentUser" name="loadUnits[${i}].cartonPrintingInfoSentUser.id" from="${login.User.list()}" optionKey="id" required="" value="${loadUnitInstance?.cartonPrintingInfoSentUser?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'cartonPrintingInfoSentUser', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: loadUnitInstance, field: 'product', 'error')} required">
				<label for="product" class="control-label"><g:message code="loadUnit.product.label" default="Product" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="loadUnits[${i}].product" name="loadUnits[${i}].product.id" from="${product.Product.list()}" optionKey="id" required="" value="${loadUnitInstance?.product?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'product', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: loadUnitInstance, field: 'quantity', 'error')} required">
				<label for="quantity" class="control-label"><g:message code="loadUnit.quantity.label" default="Quantity" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="loadUnits[${i}].quantity" step="any" required="" value="${loadUnitInstance.quantity}"/>
					<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'quantity', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: loadUnitInstance, field: 'unitPrice', 'error')} required">
				<label for="unitPrice" class="control-label"><g:message code="loadUnit.unitPrice.label" default="Unit Price" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="loadUnits[${i}].unitPrice" step="any" required="" value="${loadUnitInstance.unitPrice}"/>
					<span class="help-inline">${hasErrors(bean: loadUnitInstance, field: 'unitPrice', 'error')}</span>
				</div>
			</div>

	
	
	</g:each>
</div>




<input type="button" class="btn btn-inverse" value="${message(code:'wish.loadUnit.add')}" onClick="addLoadUnit();" />