$("document").ready( function() {

	/* para elegir la familia */
	var padreSubFamily = $("#subFamily").closest(".controls").closest(".control-group");
	if ( $("select#subFamily option").length < 2 )
		padreSubFamily.hide();

	/* ocultar y mostrar el select de la subfamilia*/
	$("#family").change( function()
	{
		if($("#family").val()=="null")
		{
			$(padreSubFamily).hide(500);
			$("#subFamily").empty();
		}
		else
		{
			$("#subFamily").load(dirFamily+$('#family').val(), function() {
				if ( $("select#subFamily option").length < 2 )
					$(padreSubFamily).hide(500);
				else
					$(padreSubFamily).show(500);
			});

		}
	});
	
	/* para manejar la carga de códigos por usuarios */
	
	var codeIdBtnDelFunc = function(nro) {
		return "codeBtnDelTempNode-"+ nro;
	};

	var codeNameSelectFunc = function(nro) {
		return "codePerCustomer[" + nro + "].customer.id";
	};

	var codeNameTextFunc = function(nro) {
		return "codePerCustomer[" + nro + "].code";
	};

	var codeDelNode = function(objeto) 
	{
		var nroRef = parseInt(objeto.id.split("-")[1]); 
		var nodo = $(objeto).closest("tr");
		rowsCode--;

		
		var hermano = nodo;

		for (var i = nroRef; i < rowsCode; i++)
		{
			hermano = hermano.next();

			hermano.find("select").attr("name", codeNameSelectFunc(i));
			hermano.find("input").attr("name", codeNameTextFunc(i));
			hermano.find("a").attr("id", codeIdBtnDelFunc(i));
		}

		nodo.remove();		
	};
	
	$(".deleteTempCode").click ( function() {
		codeDelNode(this);
	});
	
	$("#addCustomerCode").click( function() {

		var idBtnDel = codeIdBtnDelFunc(rowsCode);
		var selectNode = "<select name='"+ codeNameSelectFunc(rowsCode) +"'>" + customers + "</select>";
		var textNode = "<input type='text' name='"+ codeNameTextFunc(rowsCode) +"'>"
		var deleteNode = "<a role='button' class='btn btn-primary' id='" +idBtnDel+ "'> <i class='icon-trash'></i> </a>"
			
		var newNode = "<tr>\
			<td> " + selectNode + "	</td> \
			<td> " + textNode + "</td> \
			<td> " + deleteNode +"</td> \
			</tr>"
		$("#customerPerCodeTable").append(newNode);

		$("#"+idBtnDel).click( function() {
			codeDelNode(this);
		} );
		
		rowsCode++;
	});

});