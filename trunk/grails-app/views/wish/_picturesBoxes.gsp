<%@ page import="wish.Picture" %>
<%@ page import="wish.Wish" %>

<p>
<div id="create-picture-box">

	<!-- Button to trigger modal -->
	<a href="#modalCreateBox" role="button" class="btn btn-primary" data-toggle="modal">Agregar foto</a>
	 
	<!-- Modal -->
	<div id="modalCreateBox" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalCreateBoxLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="modalCreateBoxLabel">Subir archivo</h3>
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

<div id="modal-create-picture-box">
	<!-- Button to trigger modal -->
	<a href="#modalPictureBoxes" role="button" class="btn btn-primary" data-toggle="modal">Ver fotos</a>
	 
	<!-- Modal -->
	<div id="modalPictureBoxes" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	 	<div class="modal-header">
	    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	  	</div>

		<div class="modal-body">
		    
		    <div id="carouselBoxes" class="carousel slide">  
		            <!-- Carousel items -->  
				<div class="carousel-inner"> 

		       			<g:each in="${wishInstance.picturesOfPrintingBoxes}" var="picture" status="i">	
							<g:if test="${i == 0}">
							     <div class="active item">
									<img src="${createLink(action: 'viewPicture',id: picture.id)}" width="350" height="350"/>
		                   			<div class="carousel-caption">
										<p>${picture.description}</p>
									</div>
								</div>
							</g:if> 
							<g:else>
								<div class="item">
									<img src="${createLink(action: 'viewPicture',id: picture.id)}" width="350" height="350"/>
								    <div class="carousel-caption">
										<p>${picture.description}</p>
									</div>
								</div> 
							</g:else>
						</g:each>
				</div>  
		  	<!-- Carousel nav -->  
		  		<a class="carousel-control left" href="#carouselBoxes" data-slide="prev">&lsaquo;</a>  
		 		<a class="carousel-control right" href="#carouselBoxes" data-slide="next">&rsaquo;</a>  
			</div>  

		</div>
		
		<div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div>
</div>

