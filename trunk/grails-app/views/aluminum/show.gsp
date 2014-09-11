
<%@ page import="product.Aluminum" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminum.label', default: 'Aluminum')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'aluminum.css')}" />

</head>

<body>

<section id="show-aluminum" class="first">

	<div class="row-fluid">
		<div class="span8">
			<table class="table">
				<tbody>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="aluminum.descriptionSP.label" default="Description SP" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "descriptionSP")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="aluminum.descriptionEN.label" default="Description EN" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "descriptionEN")}</td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="aluminum.cayasCode.label" default="Cayas Code" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "cayasCode")}</td>
						
					</tr>
					
							
					<tr class="prop">
						<td valign="top" class="name"><g:message code="aluminum.supplier.label" default="Supplier" /></td>
						
						<td valign="top" class="value"><g:link controller="supplier" action="show" id="${aluminumInstance?.supplier?.id}">${aluminumInstance?.supplier?.encodeAsHTML()}</g:link></td>
						
					</tr>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="aluminum.supplierCode.label" default="Supplier Code" /></td>
						
						<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "supplierCode")}</td>
						
					</tr>
				</tbody>
			</table>
		</div>
		<div class="span4 picture">
			<g:if test="${!aluminumInstance?.picture}">
			    <g:uploadForm action="uploadPicture" params="[idAluminum: aluminumInstance?.id]">
        			<input type="file" name="pictureFile" />
        			<input type="submit" class="btn btn-primary" value='${message( code:"aluminum.picture.upload", default:"Upload Image") }'/>
    			</g:uploadForm>
			</g:if>
			<g:else>
				<img src="${createLink(action: 'showPicture', id: aluminumInstance?.picture?.id)}" width="300" height="300"/>
				<a id="changeImage" role="button" class="btn btn-primary"> <g:message code="aluminum.picture.change" default="Change Image"/> </a>
				<g:uploadForm action="uploadPicture" params="[idAluminum: aluminumInstance?.id]" class="hidden" name="picForm">
        			<input type="file" name="pictureFile" />
        			<div class="row-fluid">
        				<div class="span6"><input type="submit" class="btn btn-primary" value='${message( code:"aluminum.picture.upload", default:"Upload Image") }'/></div>
        				<div class="span6"><a id="pictureCancel" role="button" class="btn btn-primary"> ${message( code:"aluminum.picture.cancel", default:"Cancel") } </a></div>
        			</div>     			
    			</g:uploadForm>
			</g:else>
		</div>
	</div>
	<table class="table">
		<tbody>
			<g:render template="/_abstractProduct/codePerCustomerShow" model="['productInstance': aluminumInstance]" />

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.plane.label" default="Plane" /></td>
				
				<td valign="top" class="value">
				
					<g:if test="${!aluminumInstance?.plane}">
						<a id="uploadPlane" role="button" class="btn btn-primary">${message( code:"aluminum.picture.upload", default:"Upload Image") } </a>
					</g:if>
					<g:else>
					<div id="planeModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						  <div class="modal-header">
						    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						    <h3 id="myModalLabel"><g:message code="aluminum.plane.label" default="Plane" /></h3>
						  </div>
						  <div class="modal-body">
								<img src="${createLink(action: 'showPicture', id: aluminumInstance?.plane?.id)}" width="300" height="300"/>
						  </div>
						  <div class="modal-footer">
						    <a href="#showPlane" class="btn" data-dismiss="modal">Close</a>
						  </div>
						</div>
					
						<a id="uploadPlane" role="button" class="btn btn-primary">${message( code:"aluminum.picture.change", default:"Change Image") } </a>
						<a id="showPlane" href="#planeModal" data-toggle="modal" role="button" class="btn btn-primary">${message( code:"aluminum.picture.show", default:"View") } </a>
					</g:else>		
			
					<g:uploadForm action="uploadPlane" params="[idAluminum: aluminumInstance?.id]" class="hidden picture" name="planeForm">
	        			<input type="file" name="planeFile" />
	        			<div class="row-fluid">
        					<div class="span6"><input type="submit" class="btn btn-primary" value='${message( code:"aluminum.plane.upload", default:"Upload Plane") }'/></div>
        					<div class="span6">
        						<g:if test="${aluminumInstance?.plane}">
        						<a id="planeCancel" role="button" class="btn btn-primary"> ${message( code:"aluminum.picture.cancel", default:"Cancel") } </a>
        						</g:if>
        					</div>
        				</div>   
	    			</g:uploadForm>
	    			
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.mold.label" default="Mold" /></td>
				
				<td valign="top" class="value">
					<g:if test="${aluminumInstance.mold}">
						<g:message code="aluminum.mold.${aluminumInstance.mold}" default="${aluminumInstance.mold.toString()}"/>
					</g:if>
					
					<ul>
					<g:each in="${aluminumInstance.moldCustomer}" var="m">
						<li><g:link controller="customer" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
					
				</td>
				
			</tr>
										
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.originalPlane.label" default="Original Plane" /></td>
				
				<td valign="top" class="value">
					<g:if test="${aluminumInstance.originalPlane}">
						<g:message code="aluminum.originalPlane.${aluminumInstance.originalPlane}" default="${aluminumInstance.originalPlane.toString()}"/>
					</g:if>
				
					<ul>
					<g:each in="${aluminumInstance.originalPlaneSupplier}" var="o">
						<li><g:link controller="supplier" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.temple.label" default="Temple" /></td>
				
				<td valign="top" class="value"><g:link controller="temple" action="show" id="${aluminumInstance?.temple?.id}">${aluminumInstance?.temple?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.finish.label" default="Finish" /></td>
				
				<td valign="top" class="value"><g:link controller="finish" action="show" id="${aluminumInstance?.finish?.id}">${aluminumInstance?.finish?.encodeAsHTML()}</g:link></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.unit.label" default="Unit" /></td>
				
				<td valign="top" class="value"><g:link controller="itemUnit" action="show" id="${aluminumInstance?.unit?.id}">${aluminumInstance?.unit?.encodeAsHTML()}</g:link></td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.externalProfileDimension.label" default="External Profile Dimension" /></td>
				
				<td valign="top" class="value">
					<g:if test="${aluminumInstance.externalProfileL == null || aluminumInstance.externalProfileL == externalProfileW }">
						${fieldValue(bean: aluminumInstance, field: "externalProfileL")} ${fieldValue(bean: aluminumInstance, field: "externalProfileW")}
					</g:if>
					<g:else>
						${fieldValue(bean: aluminumInstance, field: "externalProfileL")} x ${fieldValue(bean: aluminumInstance, field: "externalProfileW")}					
					</g:else>
				</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.pcsBundle.label" default="Pcs Bundle" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "pcsBundle")}</td>
				
			</tr>
										
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.sectionalL.label" default="Sectional L" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "sectionalL")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.sectionalW.label" default="Sectional W" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "sectionalW")}</td>
				
			</tr>
				
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.length.label" default="Length" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "length")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.weightPC.label" default="Weight x PC" /></td>
				
				<td valign="top" class="value">${aluminumInstance.weightPCS()}</td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.theoricalWeight.label" default="Theorical Weight" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "theoricalWeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.realWeight.label" default="Real Weight" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "realWeight")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.articlesPerContainer.label" default="Articles Per Container" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "articlesPerContainer")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.netWeightPerBox.label" default="Net Weight Per Box" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "netWeightPerBox")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.grossWeightPerBox.label" default="Gross Weight Per Box" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "grossWeightPerBox")}</td>
				
			</tr>
					
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.volumenPerBox.label" default="Volumen Per Box" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumInstance, field: "volumenPerBox")}</td>
				
			</tr>
						
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${aluminumInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminum.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${aluminumInstance?.lastUpdated}" /></td>
				
			</tr>			
		
		</tbody>
	</table>
</section>

<script type="text/javascript">
	$(document).ready( function () {
		$("#changeImage").on( "click", function() {
			$("#picForm").removeClass( "hidden" );
			$(this).hide();
		})
		
		$("#pictureCancel").on( "click", function() {
			$("#picForm").addClass( "hidden" );
			$("#changeImage").show();
		})		
		
		$("#uploadPlane").on( "click", function() {
			$("#planeForm").removeClass("hidden");
			$(this).hide();
			( $("#showPlane") == null )? "" : $("#showPlane").hide();
		})
		
		$("#planeCancel").on( "click", function() {
			$("#planeForm").addClass("hidden");
			$("#uploadPlane").show();
			( $("#showPlane") == null )? "" : $("#showPlane").show();			
		})
	})
</script>

</body>

</html>
