/* para los extras de aluminio */

var main = function() {

	$(".badge").on( 'click', function() {
		var newText = $("#equation").val() +"${"+ $(this).data("name")+"}";
		$("#equation").val( newText );

	});
}

$(document).ready(main);