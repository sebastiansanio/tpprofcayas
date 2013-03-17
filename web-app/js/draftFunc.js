var nroIdDraft = -1;


$(document).ready(function() {

	$(".add-draft").click(function()
	{		 
		var element = $("<tr> \
						 <td> <input type='text' id='text-draft-"+cantDraft+"' name='docDraftToBeApprovedBeforeDelivery[" + cantDraft + "].description'/></td> \
						 <td> <input type='file' id='file-draft-"+cantDraft+"' name='docDraftToBeApprovedBeforeDelivery[" + cantDraft + "].draft'></td> \
						 <td> <a role='button' class='btn btn-small btn-primary' id='btnDel-draft-"+cantDraft+"' onclick='delElement("+cantDraft+")'>" + messageDeleteDraft +"</a></td> \
						</tr>");

		$("#draft-table").append(element);
		
		cantDraft++;
	});
	
	$(".btnRep-draft").click(function()
	{	
		nroIdDraft = this.id.split("-")[2];
	    	    	
	   	$("#modalReplaceDraft").modal('show');
	}); 

	$("#repDraft").click(function()
	{	
		var idtext = idText(nroIdDraft);
		var idrep = idRep(nroIdDraft);
		var posicion = $(idtext).attr("name").split(".")[0];
		var idfile = idFile(nroIdDraft).split("#")[1];
		
		var element = $("<input type='file' id='"+ idfile +"' name='"+posicion+".draft'>");

		$(idrep).parent().append(element);
		$(idrep).remove();	
		
	});

	$(".btnDel-draft").click(function()
	{
		var nroId = this.id.split("-")[2];

		$("#nroCurrentDraftDelete").attr("value", nroId);
	    $("#modalDeleteDraft").modal('show'); 
	});
});

function idText(nro) {
	return "#text-draft-" + nro;
}

function idFile(nro) {
	return "#file-draft-" + nro;
}

function idRep(nro) {
	return "#btnRep-draft-" + nro;
}

function delElement(nroRef)
{
	var nameBtnDel = "#btnDel-draft-"+ nroRef;
	$(nameBtnDel).parent().parent().remove();
	cantDraft--;

	var nameText, nameFile;
	for (var i = nroRef; i < cantDraft; i++)
	{
		nameText = idText(i+1);
		nameFile = idFile(i+1);

		$(nameText).attr("name", "docDraftToBeApprovedBeforeDelivery[" + i + "].description");
		$(nameText).attr("id", "text-draft-" + i);		
		$(nameFile).attr("name", "docDraftToBeApprovedBeforeDelivery[" + i + "].draft");
		$(nameFile).attr("id", "file-draft-" + i);
	}	
}

