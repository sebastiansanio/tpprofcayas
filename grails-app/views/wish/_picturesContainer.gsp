<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>

<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'inputFile.css')}" />
<script type="text/javascript" src="${resource(dir:'js', file:'multipleInput.js')}"> </script>	

<p>
	<div id="create-picture-container">

	<!-- Button to trigger modal -->
	<a href="#modalCreateContainer" role="button" class="btn btn-primary" data-toggle="modal"> ${message(code: 'wish.loadFile.label', default: 'Add file')}</a>
	 
	<!-- Modal para cargar las imágenes -->
	<div id="modalCreateContainer" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalCreateContainerLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="modalCreateContainerLabel">${message(code: 'wish.uploadFile.label', default: 'Upload file')}</h3>
		</div>

		<g:form action="createContainerPicture" params="[idWish: wishInstance.id]" class="form-horizontal" enctype="multipart/form-data" >
		
		<div class="modal-body">
		
			<fieldset class="form">			

			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'image', 'error')} required">
				<label for="image" class="control-label"><g:message code="picture.image.label" default="Image" /><span class="required-indicator">*</span></label>
				<div class="multiple-input-file controls">
					<div class="custom-input-file">
						<input type="file" class="input-file" multiple id="image" name="image[]">
					    	<div class="btn btn-primary">${message(code: 'wish.uploadFile.label', default: 'Upload file')}</div>
					    	<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'image', 'error')}</span>
					</div>
					<p> </p>
					<ul class="input-file-ul"></ul>
				</div>
			</div>
				
			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="picture.description.label"  default="Description"/><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${pictureInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'description', 'error')}</span>
				</div>
			</div>
			</fieldset>
		</div>
		
		<div class="modal-footer">

		    <div class="form-actions">
				<g:submitButton name="createContainer" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            	<a href="#picturesOfLoadingContainerReceived" class="btn" type="reset" data-dismiss="modal"><g:message code="default.button.cancel.label" default="Cancel"/></a>
			</div>

		</div>
		</g:form>
	
	</div>

</div>
</p>

<div id="modal-view-picture-container">
	<!-- Button to trigger modal -->
	<a href="#modalPictureContainer" role="button" class="btn btn-primary" data-toggle="modal">${message( code: 'wish.viewPicture.label', default: 'View picture')}</a>
	 
	<!-- Modal -->
	<div id="modalPictureContainer" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalPictureContainerLabel" aria-hidden="true">
	 	<div class="modal-header">
	    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    	
  			<!-- menu para editar o eliminar una foto -->
            <ul class="nav nav-pills">
            	<li>
                    <a href="#modalEditContainer" role="button" id="editPhotoContainer"> <i class="icon-pencil"></i> ${message(code: 'default.button.edit.label', default: 'Edit')}</a>
                </li>
                <li>
                     <a href="#modalDeleteContainer" role="button" id="deletePhotoContainer"> <i class="icon-trash"></i> ${message( code: 'default.button.delete.label', default: 'Delete')} </a>
                </li>
            </ul>
            
	  	</div>

		<div class="modal-body">
		    <!-- carousel para mostrar las fotos -->
		    <div id="carouselContainers" class="carousel slide">  
		        <!-- Carousel items -->  
				<div id="itemsCarouselContainer" class="carousel-inner"> 

					<g:each in="${wishInstance.picturesOfLoadingContainer}" var="picture" status="i">
<!--  poner lo de in wishInstance.picturesOfPrintingBoxes  -->					
						<div class="<%if((i==0 && idPictureUpdate==null) || (idPictureUpdate!=null && idPictureUpdate==picture.id.toString())) out.println("active ")%>item">
							<img src="${createLink(action: 'viewPicture',id: picture.id)}"/>
		                	<div class="carousel-caption">
								<p>${picture.description}</p>
							</div>
						</div>					
					</g:each>
				</div>  
		  
		  		<!-- Carousel nav -->  
		  		<a class="carousel-control left" href="#carouselContainers" data-slide="prev">&lsaquo;</a>  
		 		<a class="carousel-control right" href="#carouselContainers" data-slide="next">&rsaquo;</a>  
			</div>  

		</div>
		
		<div class="modal-footer">
		    <a href="#picturesOfLoadingContainerReceived" class="btn" data-dismiss="modal"> ${message(code: 'default.close.label', default: 'Close')}</a>
		</div>
	</div>
</div>

<!-- Modal para borrar una imagen -->
	<div id="modalDeleteContainer" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalDeleteContainerLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="modalDeleteContainerLabel">${message(code: 'wish.deletePicture.label', default: 'Delete file')}</h3>
		</div>

		<div class="modal-body">
	         <p>${message(code: 'default.button.delete.confirm.message', default: "Are you sure?")}</p>
		</div>

		<div class="modal-footer">
			<g:form action="deleteContainerPicture" params="[idWish: wishInstance.id]">
				<a href="#picturesOfLoadingContainerReceived" class="btn" id="cancelDeletePhotoContainer"><g:message code="default.button.cancel.label" default="Cancel"/></a>
				<g:hiddenField name="id" id="idCurrentPhotoContainerDelete" />
				<span class="button"><g:actionSubmit class="btn btn-danger" action="deleteContainerPicture" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>
		</g:form>
		</div>
	</div>
	
<!-- Modal para editar la descripcion -->
<div id="modalEditContainer" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalEditContainerLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalEditContainerLabel">${message(code: 'wish.editPicture.label', default: 'Edit the image description')}</h3>
	</div>

	<g:form method="post" action="editPicture" params="[idWish: wishInstance.id]" class="form-horizontal" enctype="multipart/form-data" >
	<div class="modal-body">
		<fieldset class="form">
			<g:hiddenField name="id" id="idCurrentPhotoContainer" />
			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="picture.description.label"  default="Description"/><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" id="newDescriptionContainer"/>
					<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'description', 'error')}</span>
				</div>
			</div>
		</fieldset>
	</div>

	<div class="modal-footer">
		<div class="form-actions">
	    	<g:submitButton name="editContainer" class="btn btn-primary" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
          		<a href="#picturesOfLoadingContainerReceived" class="btn" type="reset" id="cancelEditPhotoContainerDescription"><g:message code="default.button.cancel.label" default="Cancel"/></a>
          	</div>
	</div>
	</g:form>
</div>

<!-- Para ver si llegó a esta página por modificar una foto o era para ver el pedido -->
<g:if test="${wishInstance?.picturesOfLoadingContainer.find{it.id.toString() == idPictureUpdate } }">
	
 </g:if>
 
<g:if test="${idPictureUpdate != null}">
	<g:if test="${wishInstance?.picturesOfLoadingContainer.find{it.id.toString() == idPictureUpdate } }">
		<script type="text/javascript">
			$(document).ready(function() {
				$("#itemsCarouselBoxes").children(".item").first().attr("class", "active item");
				$("#modalPictureContainer").modal('show');
			});	
		</script>
	</g:if>			
	<g:elseif test="${wishInstance?.picturesOfPrintingBoxes.find{it.id.toString() == idPictureUpdate } }">
		<script type="text/javascript">
			$(document).ready(function() {
				$("#itemsCarouselContainer").children(".item").first().attr("class", "active item");
				$("#modalPictureBoxes").modal('show');
			});	
		</script>
	</g:elseif> 	
</g:if>

<script type="text/javascript">
	<!-- para la edición de una descripción -->
    $("#editPhotoContainer").click(function(){

    	$("#carouselContainers").carousel('pause');
    	
    	var pathPhoto = $("#itemsCarouselContainer").find(".active").children("img").attr("src").split("/");
    	var currentPhotoId = pathPhoto[pathPhoto.length-1];
    	var currentPhotoDescription = $("#itemsCarouselContainer").find(".active").children(".carousel-caption").children("p").text();
    	    	
    	$("#newDescriptionContainer").attr("value", currentPhotoDescription);
    	$("#idCurrentPhotoContainer").attr("value", currentPhotoId);
        $("#modalPictureContainer").modal('hide');
        $("#modalEditContainer").modal('show');
    });

    $("#deletePhotoContainer").click(function(){

    	$("#carouselContainers").carousel('pause');
    	var pathPhoto = $("#itemsCarouselContainer").find(".active").children("img").attr("src").split("/");
    	var currentPhotoId = pathPhoto[pathPhoto.length-1];

    	$("#idCurrentPhotoContainerDelete").attr("value", currentPhotoId);

        $("#modalPictureContainer").modal('hide');
        $("#modalDeleteContainer").modal('show');
    });
    
    $("#cancelEditPhotoContainerDescription").click(function(){      
        $("#modalEditContainer").modal('hide');
    	$("#modalPictureContainer").modal('show');
    });

    $("#cancelDeletePhotoContainer").click(function(){      
        $("#modalDeleteContainer").modal('hide');
    	$("#modalPictureContainer").modal('show');
    });

</script>
