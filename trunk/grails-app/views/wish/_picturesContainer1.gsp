<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>


<script type="text/javascript">

	var picturesOfLoadingContainerCount = ${wishInstance?.picturesOfLoadingContainer?.size()} + 0;

	function addPicturesOfLoadingContainer(){
		var htmlId = "picturesOfLoadingContainer" + picturesOfLoadingContainerCount;
		
		var deleteIcon = "${resource(dir:'images/skin',file:'database_delete.png')}";
		var templateHtml = "<div class='row' id='" + htmlId + "' name='" + htmlId +"'>";	

		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='image' class='control-label'>";
		templateHtml += "${message(code:'picture.image.label')}";
		templateHtml += "<div class='controls'>";
		templateHtml += "<input type='file' id='picturesOfLoadingContainer["+picturesOfLoadingContainerCount+"].image' name='picturesOfLoadingContainer["+picturesOfLoadingContainerCount+"].image' />";
		templateHtml += "</div>";
		templateHtml += "</div>";
		
		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='description' class='control-label'> ${message(code:'picture.description.label')} </label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<input type='text' name='picturesOfLoadingContainer["+picturesOfLoadingContainerCount+"].description' />";
		templateHtml += "</div>";
		templateHtml += "</div>";
		templateHtml += "</div>";

		$("#picturesOfLoadingContainerChildList").append(templateHtml);			
		picturesOfLoadingContainerCount++;
				
	}

	
</script>

<div id="picturesOfLoadingContainerChildList">
	
	<g:each var="pictureInstance" in="${wishInstance?.picturesOfLoadingContainer}" status="i">
	
	<div class="row">
		
			<g:message code="picture.label" default="Image" />:
			<g:message code="picture.description.label" default="Description" />
			<g:textField name="picturesOfLoadingContainer[${i}].description" value="${pictureInstance?.description}"/>
			<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'description', 'error')}</span>
	
	</div>
	</g:each>
	
	
</div>
<input type="button" class="btn btn-inverse" value="${message(code:'picturesOfLoadingContainer.add')}" onClick="addPicturesOfLoadingContainer();" />
