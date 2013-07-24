
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
	<g:select id="year" name="year" from="${yearInit..yearCurrent}" value="${yearCurrent}" class="offset1" />
  
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
						<td class="label label-important">
							<g:findAll in="${letters}" expr="it.customer.id == customer.id && it.forwarder.id == forwarder.id">	 
     								     									
     								<g:link action="show" params="[customer:'[id:'+customer?.id+']', 'customer.id':customer?.id, forwarder:'[id:'+forwarder?.id+']', 'forwarder.id':forwarder?.id, year:year]"><i class="icon-edit icon-white "></i>	</g:link>
     								
     								<script>
     									$("td").last().removeClass("label-important").addClass("label-success");	
     								</script>
     								
							</g:findAll>
						</td>
						 
					</g:each>
				
				
				</tr>			
					
			</g:each>
		</tbody>
	</table>	
	
</section>

</body>

</html>
