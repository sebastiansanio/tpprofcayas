$(document).ready(function() 
{
	$(".input-file").change(function() {

		borrarNombresDeArchivo( this );

		for(var i=0; i< $(this).get(0).files.length; i++)
		{				
			var nombre = $(this).get(0).files.item(i).name;
			var tag = "<li name='file[" + i + "]'>" + nombre + "</li>";
			$(this).parent().parent().find(".input-file-ul").append( tag );
		}
	  
	});

	var  borrarNombresDeArchivo = function( idBoton ) {
		$(idBoton).parent().parent().find(".input-file-ul").children().remove();
	};
});
