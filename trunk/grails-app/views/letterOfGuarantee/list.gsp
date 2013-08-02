<%@page import="java.lang.LinkageError"%>
<%@page import="javax.tools.ForwardingFileObject"%>
<%@ page import="wish.LetterOfGuarantee" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-letterOfGuarantee" class="first">

	<g:set var="sizeForwarders" value="${forwarders?.size()}"/>
	<g:set var="sizeCustomers" value="${customers?.size()}"/>
	
	
	<label class="control-label" for="year" style="display:inline;"><g:message code="letterOfGuarantee.year.label" default="Year" /></label>
	<select id="year" name="year" class="offset1">
		<g:each in="${(yearInit..yearCurrent)}" var="year" >
	    	<option value=${year}>${year} </option>
		</g:each>
	</select> 

	<div id="linkList" hidden="true">  
  		<g:each in="${(yearInit..yearCurrent)}" var="year" >
	    	<g:link action="list" params="[year:year]"></g:link>
		</g:each>
  	</div>
  	
  	<script type="text/javascript">

  		$( "document" ).ready( function() {

  			$( "#year option[value='${yearSelect}']").attr('selected', true);
  			
  		  	$( "#year" ).change( function () {

  		  		var nroSeleccionado = $("#year option:selected").prop('index');
				var direccion = $("#linkList").children().eq(nroSeleccionado).attr("href");

				if (direccion != '') {
  		            window.location = direccion; // redirect
  		        }
  		    });
  	  	});

  	</script>
  	
  <br>
	Cant de forwardes: ${forwarders?.size()}
	<br>
	Cant de customers: ${customers?.size()}
	<br>
	Cant de letters: ${letters?.size()}
	<br>
	
	<table class="table table-bordered">
		<thead>
			<th>  </th>
			<g:each in="${forwarders}" var="forwarder">
				<th>${forwarder}</th>
			</g:each>
		</thead>
		<tbody>
			<g:each in="${customers}" var="customer">
				
				<tr>
			
					<td>${customer}</td>
		
					<g:each in="${forwarders}" var="forwarder">
					
						<g:set var="esta" value="${letters?.find{it.customer.id == customer.id && it.forwarder.id == forwarder.id}?'label-success' : 'label-important'}"/>
						
						<g:if test="${esta == 'label-success'}">
						    <td class="label ${esta}">
								<g:link action="show" params="[customer:'[id:'+customer?.id+']', 'customer.id':customer?.id, forwarder:'[id:'+forwarder?.id+']', 'forwarder.id':forwarder?.id, year:yearSelect]"></g:link>				    	
						    </td>
						</g:if>
						<g:else>
							<td class= "label ${esta}">
								<g:link action="create" params="[customer:'[id:'+customer?.id+']', 'customer.id':customer?.id, forwarder:'[id:'+forwarder?.id+']', 'forwarder.id':forwarder?.id, year:yearSelect]"></g:link>				    	
							</td>
						</g:else>
						 
					</g:each>
					
				</tr>			
					
			</g:each>
		</tbody>
	</table>	
	
</section>

<script type="text/javascript">

	$("document").ready( function() {

		$("td").click( function() {

			var direccion = $(this).children("a").attr("href");

				if (direccion != '') {
  		            window.location = direccion; // redirect
  		        }
		});
	});
	
</script>
</body>

</html>