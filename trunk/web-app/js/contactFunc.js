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
	var idBtnDelContact = function(nro){
		return "btnDel-contact-" + nro;
	};

	var deleteContact = function(objeto)
	{
		var nroRef = parseInt(objeto.id.split("-")[2]); 
		$(objeto).parent().remove();
		cantContact--;

		var idParentNuevo, idNameNuevo, idEmailNuevo, idPositionNuevo, idBtnDelNuevo;
		
		for (var i = nroRef; i < cantContact; i++)
		{
			idParentNuevo	= "#" + idParent((i+1));
			idNameNuevo	= "#" + idName((i+1)); 
			idEmailNuevo 	= "#" + idEmail((i+1));
			idPositionNuevo	= "#" + idPosition((i+1));
			idBtnDelNuevo 	= "#" + idBtnDelContact((i+1));
			
			$(idParentNuevo).attr( "id"	, idParent(i) );

			$(idNameNuevo).attr( "name"	, nameName(i) );
			$(idNameNuevo).attr( "id"	, idName(i) );		

			$(idEmailNuevo).attr( "name"	, nameEmail(i) );
			$(idEmailNuevo).attr( "id"	, idEmail(i) );

			$(idPositionNuevo).attr( "name"	, namePosition(i) );
			$(idPositionNuevo).attr( "id"	, idPosition(i) );

			$(idBtnDelNuevo).attr("id"	, idBtnDelContact(i) );
		}
	};
	
	$("#btnAdd-contact").click(function()
	{
		var elementName, elementEmail, elementPosition, elementBtnDel, elementParent,
			idElementParent = idParent(cantContact);
		
		
		elementName = $("<div class='control-group fieldcontain required'> \
							<label class='control-label'>" + nameLabel + "<span class='required-indicator'>*</span></label> \
							<div class='controls'> \
								<input type='text' id='" + idName(cantContact)+ "' name='" + nameName(cantContact) + "' required=''/> \
							</div> \
						</div>");
		
		elementEmail = $("<div class='control-group fieldcontain'> \
							<label class='control-label'>" + emailLabel + "</label> \
							<div class='controls'> \
								<input type='text' id='" + idEmail(cantContact) + "' name='" + nameEmail(cantContact) + "'/> \
							</div> \
						</div>");

		elementPosition = $("<div class='control-group fieldcontain'> \
								<label class='control-label'>" + positionLabel + "</label> \
								<div class='controls'> \
									<input type='text' id='" + idPosition(cantContact) + "' name='" + namePosition(cantContact) + "'/> \
								</div> \
							</div>");
		
		elementBtnDel = $("<a role='button' class='btn btn-small btn-primary' id='"+ idBtnDelContact(cantContact) +"'> <i class='icon-trash'></i> </a>");
	
		elementParent = $("<div id='" + idElementParent + "'> </div>");
		
		idElementParent = "#" + idElementParent;
		
		$("#contact").append(elementParent);
		
		$(idElementParent).append(elementName);
		$(idElementParent).append(elementEmail);
		$(idElementParent).append(elementPosition);
		$(idElementParent).append(elementBtnDel);
		$(idElementParent).append("<hr>");
		
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
});