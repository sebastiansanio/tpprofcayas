var calcularMedio = function(ancho) {
	
	if ( $(window).width() < 769 )
		return 0;
	
	return ( $(window).width() - ancho ) / 2;

};

$(document).ready(function() {
		
	/* es el menu ppal, lo clono para que cuando se mueva la barra de desplazamiento sea el menú
	 * clonado el que aparezca arriba en la ventana*/
	var nodo = $("#menuPpal").clone();
	nodo.attr("id", "menuPpal2");
	
	/* el menú solo es visible, cuando el menú original se empieza a ocultar por el desplazamiento
	 * de la barra.*/
	nodo.css("visibility", "hidden");
	
	/* el ancho del menú es igual al de span12 porque está dentro de un div span12*/
	nodo.css("width", $(".span12").css("width"));
	
	/* para que haya coincidencia con el margen */
//	nodo.css("margin-left", $(".container").css("margin-left"));
	nodo.css("margin-left", calcularMedio(nodo.css("width").replace("px", "")));	

	/* agrego el nodo clonado*/
	$("body").append(nodo);
	
});

$(window).resize(function() {
	
	/* actualizo el ancho y el margen para cuando se cambia el tamaño de la ventana*/	
	$("#menuPpal2").css("width", $(".span12").css("width"));
	$("#menuPpal2").css("margin-left", calcularMedio( $("#menuPpal2").css("width").replace("px", "") ));
	
	/*para que el subMenu no quede fijo si se achica la pantalla al tamaño menor*/
	
	if ( $(window).width() < 769 )
	{
		$("#subMenuPpal").css("position", "relative");
        $("#subMenuPpal").css("top", 0);     
	}


});


$(window).scroll(function(event) {
    
	var distancia1 = $("#panelMenuPpal").position().top - $(document).scrollTop();
	var posicion = 0;

	if ( $(window).width() > 992 ) // cuando esta fija la barra de arriba de todo
	{
		distancia1 = distancia1 - $(".container").height() ;
		posicion = $(".container").height();
	}
	      
    if (distancia1 < 0)  
    {
         $("#menuPpal2").css("position", "fixed");
         $("#menuPpal2").css("visibility", "visible");
      	 $("#menuPpal2").css("top", posicion);  
    }
    else
    {
   	 	$("#menuPpal2").css("visibility", "hidden");
    }
    
    
    var distancia2 = $("#panelSubMenu").position().top - $(document).scrollTop() - $(".container").height() -  $("#menuPpal").height();

    
    if ( $(window).width() < 769 )
    	return;
    
    if (distancia2 < 0)  
    {
        $("#subMenuPpal").css("position", "fixed");
        $("#subMenuPpal").css("top", $(".container").height() + $("#menuPpal").height() + 20);
    } 
    else
    {
         $("#subMenuPpal").css("position", "relative");
         $("#subMenuPpal").css("top", 0);       
    }
    
    
});


