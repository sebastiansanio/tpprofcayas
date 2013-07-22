var fixedHeader;

$(document).ready( function () {
	var oTable = $('#tableList').dataTable( {
	     "bInfo": false, "bPaginate": false, "bFilter": false
	    } );   
    
	fixedHeader = new FixedHeader( oTable, { "offsetTop": determinarOffset() } );
} );

$(window).resize(function() {

    fixedHeader.fnGetSettings().oOffset.top = determinarOffset();
});


/* calculo el offset */
var determinarOffset = function() {

    var offset = 0;
    var tamanoVentana = $(window).width();
    
    //ventana tamaño max => Barra + MenuPpal
    if ( tamanoVentana > 992) 
	{
    	offset = $(".container").height() +  $("#menuPpal").height();
	}
	//ventana pequeña => MenuPPal 
	else 
	{
		offset = $("#menuPpal").height();
	}

	return offset;
};