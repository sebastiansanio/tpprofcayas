$(document).ready(function() 
{
	var nameName = function(nro){
		return "contacts[" + nro + "].name";
	};	
	var nameEmail = function(nro){
		return "contacts[" + nro + "].email";
	};
	var namePosition = function(nro){
		return "contacts[" + nro + "].position";
	};
	var nameAlert = function(nro){
		return "contacts[" + nro + "].sendAlerts";
	};
	var nameReport = function(nro){
		return "contacts[" + nro + "].sendReports";
	};
	
	var idParent = function(nro){
		return "contact-" + nro;
	};
	var idName = function(nro){
		return "contacts-name-" + nro;
	};	
	var idEmail = function(nro){
		return "contacts-email-" + nro;
	};
	var idPosition = function(nro){
		return "contacts-position-" + nro;
	};
	var idAlert = function(nro){
		return "contacts-sendAlerts-" + nro;
	};
	var idReport = function(nro){
		return "contacts-sendReports-" + nro;
	};
	var idBtnDelContact = function(nro){
		return "btnDel-contact-" + nro;
	};

	var deleteContact = function(objeto)
	{
		var nroRef = parseInt(objeto.id.split("-")[2]); 
		$(objeto).parent().parent().remove();
		cantContact--;

		var idParentNuevo, idNameNuevo, idEmailNuevo, idPositionNuevo,
		idAlertNuevo, idReportNuevo, idBtnDelNuevo;
		
		for (var i = nroRef; i < cantContact; i++)
		{
			idParentNuevo	= "#" + idParent((i+1));
			idNameNuevo		= "#" + idName((i+1)); 
			idEmailNuevo 	= "#" + idEmail((i+1));
			idPositionNuevo	= "#" + idPosition((i+1));
			idAlertNuevo	= "#" + idAlert((i+1));
			idReportNuevo	= "#" + idReport((i+1));
			idBtnDelNuevo 	= "#" + idBtnDelContact((i+1));
			
			$(idParentNuevo).attr( "id"	, idParent(i) );

			$(idNameNuevo).attr( "name"	, nameName(i) );
			$(idNameNuevo).attr( "id"	, idName(i) );		

			$(idEmailNuevo).attr( "name"	, nameEmail(i) );
			$(idEmailNuevo).attr( "id"	, idEmail(i) );

			$(idPositionNuevo).attr( "name"	, namePosition(i) );
			$(idPositionNuevo).attr( "id"	, idPosition(i) );

			$(idAlertNuevo).attr( "name", nameAlert(i) );
			$(idAlertNuevo).attr( "id"	, idAlert(i) );

			$(idReportNuevo).attr( "name", nameReport(i) );
			$(idReportNuevo).attr( "id"	 , idReport(i) );

			$(idBtnDelNuevo).attr("id"	, idBtnDelContact(i) );
		}
	};
	
	$("#btnAdd-contact").click(function()
	{
		var elementName, elementEmail, elementPosition, elementAlert, 
			elementReport, elementBtnDel, elementParent, 
			idElementParent = idParent(cantContact);
		
		
		elementName = $("<td> <input type='text' id='" + idName(cantContact)+ "' name='" + nameName(cantContact) + "' required=''/> </td>");
		
		elementEmail = $("<td> <input type='text' id='" + idEmail(cantContact) + "' name='" + nameEmail(cantContact) + "'/> </td>");

		elementPosition = $("<td> <input type='text' id='" + idPosition(cantContact) + "' name='" + namePosition(cantContact) + "'/> </td>");
		
		elementAlert = $("<td> \
							<input type='hidden' name='_"+ nameAlert(cantContact) +"'> \
							<input class='hide pull-right span1' type='checkbox' name='"+ nameAlert(cantContact) +"' id='"+ idAlert(cantContact) +"'> \
							<div id='btngroup' class='btn-group radiocheckbox span1' data-toggle='buttons-radio'> \
								<div class='btn btn-small on '>" + seleccLabel + "</div> \
								<div class='btn btn-small off active btn-primary'>"+ noSeleccLabel +"</div> \
							</div> \
						</td>");
		
		elementReport = $("<td> \
				<input type='hidden' name='_"+ nameReport(cantContact) +"'> \
				<input class='hide pull-right span1' type='checkbox' name='"+ nameReport(cantContact) +"' id='"+ idReport(cantContact) +"'> \
				<div id='btngroup' class='btn-group radiocheckbox span1' data-toggle='buttons-radio'> \
					<div class='btn btn-small on '>" + seleccLabel + "</div> \
					<div class='btn btn-small off active btn-primary'>"+ noSeleccLabel +"</div> \
				</div> \
			</td>");
		
		elementBtnDel = $("<td> <a role='button' class='btn btn-small btn-primary' id='"+ idBtnDelContact(cantContact) +"'> <i class='icon-trash'></i> </a> </td>");
	
		elementParent = $("<tr id='" + idElementParent + "'> </tr>");
		
		idElementParent = "#" + idElementParent;
		
		$("#contact").append(elementParent);
		
		$(idElementParent).append(elementName);
		$(idElementParent).append(elementEmail);
		$(idElementParent).append(elementPosition);
		$(idElementParent).append(elementAlert);
		$(idElementParent).append(elementReport);
		$(idElementParent).append(elementBtnDel);
		
		$("#" + idBtnDelContact(cantContact)).click(function() {
			deleteContact(this);
		});

		cantContact++;
	});
	
	$(".btnDel-contact-temp").click(function(){
		deleteContact(this);
	});
	
	$(".btnDel-contact").click(function()
	{
		var nroId = this.id.split("-")[2];

		$("#nroContactDelete").attr("value", nroId);
	    $("#modalDeleteContact").modal('show'); 
	});
	
	$(".contact-check").click(function()
	{
		var id = "#" + this.id;
 
	    if ($(id).prop("checked") == true)
	    {
	    	$(id).attr("value", true);
	    }
	    else
	    {
	    	$(id).attr("value", false);
	    }	
	    
	    alert($(id).attr("value"));
	});
});
