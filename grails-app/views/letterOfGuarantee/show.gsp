
<%@ page import="wish.LetterOfGuarantee" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'letterOfGuarantee.label', default: 'LetterOfGuarantee')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<script type="text/javascript" src="${resource(dir:'js', file:'letterGuaranteeFunc.js')}"> </script>	
	
</head>

<body>

<section id="show-letterOfGuarantee" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.year.label" default="Year" /></td>
				
				<td valign="top" class="value"> ${letterOfGuaranteeInstance?.year}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.customer.label" default="Customer" /></td>
				
				<td valign="top" class="value"><g:link controller="customer" action="show" id="${letterOfGuaranteeInstance?.customer?.id}">${letterOfGuaranteeInstance?.customer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.forwarder.label" default="Forwarder" /></td>
				
				<td valign="top" class="value"><g:link controller="forwarder" action="show" id="${letterOfGuaranteeInstance?.forwarder?.id}">${letterOfGuaranteeInstance?.forwarder?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.deliveryDate.label" default="Delivery Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${letterOfGuaranteeInstance?.deliveryDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${letterOfGuaranteeInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterOfGuarantee.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${letterOfGuaranteeInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

<div id="linkNuevo">
	<g:link action="edit" params="[customer:'[id:'+letterOfGuaranteeInstance?.customer?.id+']', 'customer.id':letterOfGuaranteeInstance?.customer?.id, forwarder:'[id:'+letterOfGuaranteeInstance?.forwarder?.id+']', 'forwarder.id':letterOfGuaranteeInstance?.forwarder?.id, year:letterOfGuaranteeInstance?.year]"></g:link>
</div>


</body>

</html>
