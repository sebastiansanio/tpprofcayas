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
	
	$("#btnAdd-contact").click(function()
	{
//		var idBtn = "btnDel-draft-"+cantDraft;

		
		var elementName = $("<div class='control-group fieldcontain required'> \
								<label for='contacts[0].name' class='control-label'>" + nameLabel + "<span class='required-indicator'>*</span></label> \
								<div class='controls'> \
									<input type='text' id='text-cust-contact-name-"+cantCustomerContact+"' name='" + nameName(cantCustomerContact) + "' required=''/> \
								</div> \
							</div>");

//		var elementName = $("<input type='text' id='nameCustomer"+cantCustomerContact+"' name='" + nameName(cantCustomerContact) + "' required=''/>");
		
		var elementEmail = $("<div class='control-group fieldcontain'> \
								<label class='control-label'>" + emailLabel + "</label> \
								<div class='controls'> \
									<input type='text' id='text-cust-contact-email-"+cantCustomerContact+"' name='" + nameEmail(cantCustomerContact) + "'/> \
								</div> \
							</div>");

		var elementPosition = $("<div class='control-group fieldcontain'> \
									<label class='control-label'>" + positionLabel + "</label> \
									<div class='controls'> \
										<input type='text' id='text-cust-contact-position-"+cantCustomerContact+"' name='" + namePosition(cantCustomerContact) + "'/> \
									</div> \
								</div>");
		
		$("#contact").append(elementName);
		$("#contact").append(elementEmail);
		$("#contact").append(elementPosition);
		$("#contact").append("<hr>");

		cantCustomerContact++;
		
		//alert("hola");
	});	
});