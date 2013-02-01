<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>


<script type="text/javascript">

	var picturesOfPrintingBoxesCount = ${wishInstance?.picturesOfPrintingBoxes?.size()} + 0;

	function addPicturesOfPrintingBoxes(){
		var htmlId = "pictureOfPrintingBoxes" + picturesOfPrintingBoxesCount;
		
		var deleteIcon = "${resource(dir:'images/skin',file:'database_delete.png')}";
		var templateHtml = "<div class='span12' id='" + htmlId + "' name='" + htmlId +"'>";	
		templateHtml += "${message(code:'picture.image.label')}";
		templateHtml += "<input type='file' id='picturesOfPrintingBoxes["+picturesOfPrintingBoxesCount+"].image' name='picturesOfPrintingBoxes["+picturesOfPrintingBoxesCount+"].image' />";
		templateHtml += "${message(code:'picture.description.label')}";
		templateHtml += "<input type='text' name='picturesOfPrintingBoxes["+picturesOfPrintingBoxesCount+"].description' />";
		templateHtml += "</div>"
		$("#picturesOfPrintingBoxesChildList").append(templateHtml);			
		picturesOfPrintingBoxesCount++;
				
	}

	
</script>

<div id="picturesOfPrintingBoxesChildList">
	
	<g:each var="pictureInstance" in="${wishInstance?.picturesOfPrintingBoxes}" status="i">
	
	<div class="row">
		
			<g:message code="picture.label" default="Image" />:
			<g:message code="picture.description.label" default="Description" />
			<g:textField name="picturesOfPrintingBoxes[${i}].description" value="${pictureInstance?.description}"/>
			<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'description', 'error')}</span>
	
	</div>
	</g:each>
	
	
</div>
<input type="button" value="${message(code:'picturesOfPrintingBoxes.add')}" onClick="addPicturesOfPrintingBoxes();" />