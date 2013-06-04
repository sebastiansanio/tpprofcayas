
<%@ page import="modal.Ship" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ship.label', default: 'Ship')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ship" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ship.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: shipInstance, field: "name")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ship.pendingWishes.label" default="Pending Orders" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${shipInstance.wishes.findAll{it.isPending()}.sort{it.opNumber}}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w.opNumber + ' - '+w.supplier + ' > '+ w.customer +(w.supplierOrder!=null?' ('+w.supplierOrder+')':'')}</g:link></li>
					</g:each>
					</ul>
					
					
				</td>
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
