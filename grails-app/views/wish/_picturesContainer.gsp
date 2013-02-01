<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>


<script type="text/javascript">

	var picturesOfLoadingContainerCount = ${wishInstance?.picturesOfLoadingContainer?.size()} + 0;

	function addPicturesOfLoadingContainer(){
		var htmlId = "picturesOfLoadingContainer" + picturesOfLoadingContainerCount;
		
		var deleteIcon = "${resource(dir:'images/skin',file:'database_delete.png')}";
		var templateHtml = "<div class='span12' id='" + htmlId + "' name='" + htmlId +"'>";	
		templateHtml += "${message(code:'picture.image.label')}";
		templateHtml += "<input type='file' id='picturesOfLoadingContainer["+picturesOfLoadingContainerCount+"].image' name='picturesOfLoadingContainer["+picturesOfLoadingContainerCount+"].image' />";
		templateHtml += "${message(code:'picture.description.label')}";
		templateHtml += "<input type='text' name='picturesOfLoadingContainer["+picturesOfLoadingContainerCount+"].description' />";
		templateHtml += "</div>"
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
<input type="button" value="${message(code:'picturesOfLoadingContainer.add')}" onClick="addPicturesOfLoadingContainer();" />
