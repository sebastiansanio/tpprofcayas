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
											
						<g:if test="${letters?.find{it[0].id == customer.id && it[1].id == forwarder.id} != null}"> <!-- figura en la lista -->
						
							<g:set var="letter" value="${letters?.find{it[0].id == customer.id && it[1].id == forwarder.id && it[2] != null}}"/>
						
							<g:if test="${letter != null}">
								<g:if test="${letter[3] == true }">
								    <td class="label label-success" title="<g:message code="letterOfGuarantee.labelNeedAndReady.label" />">
										<g:link action="show" id="${letter[2]}"></g:link>
													    	
								    </td>
								</g:if>
								<g:else>
								    <td class="label label-warning" title="<g:message code="letterOfGuarantee.labelNotNeedAndReady.label" />">
										<g:link action="show" id="${letter[2]}"></g:link>				    	
								    </td>
								</g:else>
							</g:if>
							<g:else>
								<td class= "label label-important" title="<g:message code="letterOfGuarantee.labelNeedAndNotReady.label" />">
									<g:link action="create" params="['customer.id':customer?.id, 'forwarder.id':forwarder?.id, year:yearSelect]"></g:link>				    	
								</td>
							</g:else>
						</g:if>
						<g:else> <!-- no figura en la lista -->
							<td class="label label-info" title="<g:message code="letterOfGuarantee.labelNotNeedAndNotReady.label" />">	
									<g:link action="create" params="['customer.id':customer?.id, 'forwarder.id':forwarder?.id, year:yearSelect]"></g:link>				    	
						    </td>	
						</g:else> 
					</g:each>
					
				</tr>			
					
			</g:each>
		</tbody>
	</table>	
	
	<ul>
		<li class="label label-info"> <h6> <g:message code="letterOfGuarantee.labelNotNeedAndNotReady.label" /> </h6> </li>
		<li class="label label-success"> <h6> <g:message code="letterOfGuarantee.labelNeedAndReady.label" /> </h6> </li>
		<li class="label label-warning"> <h6> <g:message code="letterOfGuarantee.labelNotNeedAndReady.label" /> </h6> </li>
		<li class="label label-important"> <h6> <g:message code="letterOfGuarantee.labelNeedAndNotReady.label" /> </h6> </li>
	</ul>
</section>

<script type="text/javascript">

	$("document").ready( function() {

		$("td").on( "click" ,function() {
			
			var direccion = $(this).children("a").attr("href");

			if (direccion != '') {
 		            window.location = direccion; // redirect
 		    }
		});

	});
	
</script>

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
</body>

</html>