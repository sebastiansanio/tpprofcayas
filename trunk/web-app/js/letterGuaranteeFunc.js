
$("document").ready( function() {

	// para el editar
	var pathNuevo = $("#linkNuevo").children("a").attr("href");
	var elementoLinkEdit = $("#subMenuPpal").find(".icon-pencil").closest("a").attr("href", pathNuevo );
	


});