$(document).ready(function() {

	var nameDate = function(nro){
		return "loadUnits[" + nro + "].cartonPrintingInfoSentDate";
	};	
	var nameUser = function(nro){
		return "loadUnits[" + nro + "].cartonPrintingInfoSentUser.id";
	};
	var nameProduct = function(nro){
		return "loadUnits[" + nro + "].product.id";
	};
	var nameQuantity = function(nro){
		return "loadUnits[" + nro + "].quantity";
	};
	var nameUnitPrice = function(nro){
		return "loadUnits[" + nro + "].unitPrice";
	};
	var nameBtnDel = function(nro){
		return "btnDel-unit-" + nro;
	};
	
	var idDate = function(nro){
		return "loadUnit-cartonPrintingInfoSentDate-" + nro ;
	};	
	var idUser = function(nro){
		return "loadUnit-cartonPrintingInfoSentUser-"+ nro;
	};
	var idProduct = function(nro){
		return "loadUnit-product-" + nro;
	};
	var idQuantity = function(nro){
		return "loadUnit-quantity-"+ nro ;
	};
	var idUnitPrice = function(nro){
		return "loadUnit-unitPrice-"+ nro;
	};

	var delUnit = function(elemento)
	{
		var nroId = parseInt(elemento.id.split('-')[2]);
		
		$("#"+elemento.id).parent().parent().remove();
		loadUnitCount--;

		/*renombrar el resto*/
		var date, user, product, quantity, price, btnDel;
		for (var i = nroId; i < loadUnitCount; i++)
		{
			date = idDate(i+1);
			user = idUser(i+1);
			product = idProduct(i+1);
			quantity = idQuantity(i+1);
			price = idUnitPrice(i+1);
			btnDel = nameBtnDel(i+1);
							 
			$("#"+date).attr("name", nameDate(i));
			$("#"+date).attr("id", nameDate(i));  
			
			$("#"+user).attr("name", nameUser(i)+".id");
			$("#"+user).attr("id", nameUser(i));
			
			$("#"+product).attr("name", nameProduct(i)+".id");
			$("#"+product).attr("id", nameProduct(i));
			
			$("#"+quantity).attr("name", nameQuantity(i));
			$("#"+quantity).attr("id", nameQuantity(i));

			$("#"+price).attr("name", nameUnitPrice(i));
			$("#"+price).attr("id", nameUnitPrice(i));
			
			$("#"+btnDel).attr("id", nameBtnDel(i));
		}		
	};
	
	$("#btnLoadUnit").click(function() 
	{		 
		var templateHtml = "<tr>";	
		
		templateHtml += "<td>";
		templateHtml += "<input id='" + idDate(loadUnitCount) + "' name='" + nameDate(loadUnitCount) + "' type='text' class='datepicker' data-date-format='dd/mm/yyyy'/>";
		templateHtml += "</td>";
	
		templateHtml += "<td>";
		templateHtml += "<select id='" + idUser(loadUnitCount) + "' name='" + nameUser(loadUnitCount) + "'>";
		
		for (var i = 0; i < usuarios.length; i++)
		{
			templateHtml += "<option value='" + usuarios[i].id + "'>" + usuarios[i].nombre + "</option>";
		}
		
		templateHtml += "</select>";
		templateHtml += "</td>";
	
		templateHtml += "<td>";
		templateHtml += "<select id='" + idProduct(loadUnitCount) + "' name='" + nameProduct(loadUnitCount) +"'>";
		
		for (var i = 0; i < productos.length; i++)
		{
			templateHtml += "<option value='" + productos[i].id + "'>" + productos[i].nombre + "</option>";
		}
			
		templateHtml += "</select>";
		templateHtml += "</td>";		
	
		templateHtml += "<td>";
		templateHtml += "<input type='number' class='span2' step='any' id='" + idQuantity(loadUnitCount) + "' name='" + nameQuantity(loadUnitCount) +"' />";
		templateHtml += "</td>";
	
		templateHtml += "<td>";
		templateHtml += "<input type='number' class='span2' step='any' id='"+ idUnitPrice(loadUnitCount) +"' name='" + nameUnitPrice(loadUnitCount) +"' />";
		templateHtml += "</td>";

		templateHtml += "<td>";
		templateHtml += "<a role='button' class='btn btn-primary' id='" + nameBtnDel(loadUnitCount) +"'><i class='icon-trash'></i></a>";
		templateHtml += "</td>";
		
		templateHtml += "</tr>";
		$("#loadUnit-table").append(templateHtml);		
		
		$("#"+idDate(loadUnitCount)).datepicker({
			format: 'dd/mm/yyyy',
		});
		
		$("#"+nameBtnDel(loadUnitCount)).click(function()  
		{
			delUnit(this);
		});
		
		loadUnitCount++;
		
	});
	
	$(".btnDel-unit").click(function() 
	{
		var nroId = this.id.split("-")[2];

		$("#nroCurrentUnitDelete").attr("value", nroId);
	    $("#modalDeleteUnit").modal('show'); 
	});
	
	$(".btnDel-unit-temp").click(function() 
	{
		delUnit(this);
	});
});
	