<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>

<p>
<div id="create-picture-box">
	<!-- Button to trigger modal -->
	<a href="#modalCreateBox" role="button" class="btn btn-primary" data-toggle="modal"> ${message(code: 'wish.loadFile.label', default: 'Add file')}</a>
	
	<!-- Modal -->
	<div id="modalCreateBox" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalCreateBoxLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="modalCreateBoxLabel">${message(code: 'wish.uploadFile.label', default: 'Upload file')}</h3>
		</div>

		<g:form action="createBoxPicture" params="[idWish: wishInstance.id]" class="form-horizontal" enctype="multipart/form-data" >
		
		<div class="modal-body">
		
			<fieldset class="form">			
				
			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'image', 'error')} required">
				<label for="image" class="control-label"><g:message code="picture.image.label" default="Image" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="image" name="image" />
					<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'image', 'error')}</span>
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
			    <g:submitButton name="createBoxes" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            	<button class="btn" type="reset" data-dismiss="modal">Cancel</button>
			</div>

		</div>
		</g:form>
	
	</div>

</div>
</p>

<!-- ver fotos  -->
<div id="modal-view-picture-box">
	<!-- Button to trigger modal -->
	<a href="#modalPictureBoxes" role="button" class="btn btn-primary" data-toggle="modal">${message( code: 'wish.viewPicture.label', default: 'View picture')}</a>
	 
	<!-- modal para ver las fotos -->
	<div id="modalPictureBoxes" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalPictureBoxesLabel" aria-hidden="true">
	
		<div class="modal-header">
	    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
 			<!-- menu para editar o eliminar una foto -->
            <ul class="nav nav-pills">
            	<li>
                    <a href="#modalEditBox" role="button" id="editPhotoBox"> <i class="icon-pencil"></i> ${message(code: 'default.button.edit.label', default: 'Edit')}</a>
                </li>
                <li>
                     <a href="#modalDeleteBox" role="button" id="deletePhotoBox"> <i class="icon-trash"></i> ${message( code: 'default.button.delete.label', default: 'Delete')} </a>
                </li>
            </ul>
	  	</div>

		<div class="modal-body">
			<!-- carousel para mostrar las fotos -->
		    <div id="carouselBoxes" class="carousel slide">  
		        <!-- Carousel items -->
				<div id="itemsCarouselBoxes" class="carousel-inner"> 

					<g:each in="${wishInstance.picturesOfPrintingBoxes}" var="picture" status="i">
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
		  		<a class="carousel-control left" href="#carouselBoxes" data-slide="prev">&lsaquo;</a>  
		 		<a class="carousel-control right" href="#carouselBoxes" data-slide="next">&rsaquo;</a>  
			</div>  

		</div>
		
		<div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true"> ${message(code: 'default.close.label', default: 'Close')} </button>
		</div>
		
	</div>
</div>


<!-- Modal para borrar una imagen -->
	<div id="modalDeleteBox" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalBorrarBoxLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="modalBorrarBoxLabel">${message(code: 'wish.deletePicture.label', default: 'Delete file')}</h3>
		</div>

		<div class="modal-body">
	         <p>${message(code: 'default.button.delete.confirm.message', default: "Are you sure?")}</p>
		</div>

		<div class="modal-footer">
<!-- 			<g:form action="deleteBoxPicture" params="[idWish: wishInstance.id]">
				<div class="form-actions">
		        	<span class="button"><g:actionSubmit class="btn btn-danger" action="deleteBox" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>
            		<button class="btn" type="reset" data-dismiss="modal">Cancel</button>
            	</div>
			</g:form> -->
			<g:form action="deleteBoxPicture" params="[idWish: wishInstance.id]">
				<button class="btn" id="cancelDeletePhotoBox"><g:message code="default.button.cancel.label" default="Cancel"/></button>
				<g:hiddenField name="id" id="idCurrentPhotoBoxDelete" />
				<span class="button"><g:actionSubmit class="btn btn-danger" action="deleteBoxPicture" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>
		</g:form>
		</div>
	</div>


<!-- Modal para editar la descripcion -->
<div id="modalEditBox" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalEditBoxLabel" aria-hidden="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="modalEditBoxLabel">${message(code: 'wish.editPicture.label', default: 'Edit the image description')}</h3>
	</div>

	<g:form method="post" action="editPicture" params="[idWish: wishInstance.id]" class="form-horizontal" enctype="multipart/form-data" >
	<div class="modal-body">
		<fieldset class="form">
			<g:hiddenField name="id" id="idCurrentPhotoBox" />
			<div class="control-group fieldcontain ${hasErrors(bean: pictureInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="picture.description.label"  default="Description"/><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" id="newDescriptionBox"/>
					<span class="help-inline">${hasErrors(bean: pictureInstance, field: 'description', 'error')}</span>
				</div>
			</div>
		</fieldset>
	</div>

	<div class="modal-footer">
		<div class="form-actions">
	    	<g:submitButton name="editBoxes" class="btn btn-primary" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
          		<button class="btn" type="reset" id="cancelEditPhotoBoxDescription">Cancel</button>
          	</div>
	</div>
	</g:form>
</div>

<script type="text/javascript">
	<!-- para la edición de una descripción -->
    $("#editPhotoBox").click(function(){

    	$("#carouselBoxes").carousel('pause');
    	
    	var pathPhoto = $("#itemsCarouselBoxes").find(".active").children("img").attr("src").split("/");
    	var currentPhotoId = pathPhoto[pathPhoto.length-1];
    	var currentPhotoDescription = $("#itemsCarouselBoxes").find(".active").children(".carousel-caption").children("p").text();
    	    	
    	$("#newDescriptionBox").attr("value", currentPhotoDescription);
    	$("#idCurrentPhotoBox").attr("value", currentPhotoId);
        $("#modalPictureBoxes").modal('hide');
        $("#modalEditBox").modal('show');
    });

    $("#deletePhotoBox").click(function(){

    	$("#carouselBoxes").carousel('pause');
    	
    	var pathPhoto = $("#itemsCarouselBoxes").find(".active").children("img").attr("src").split("/");
    	var currentPhotoId = pathPhoto[pathPhoto.length-1];
    	    	    	
    	$("#idCurrentPhotoBoxDelete").attr("value", currentPhotoId);
        $("#modalPictureBoxes").modal('hide');
        $("#modalDeleteBox").modal('show');
    });
    
    $("#cancelEditPhotoBoxDescription").click(function(){      
        $("#modalEditBox").modal('hide');
    	$("#modalPictureBoxes").modal('show');
    });

    $("#cancelDeletePhotoBox").click(function(){      
        $("#modalDeleteBox").modal('hide');
    	$("#modalPictureBoxes").modal('show');
    });

</script>
