
<%@ page import="courier.Courier" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'courier.label', default: 'Courier')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-courier" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courierInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.web.label" default="Web" /></td>
				
				<td valign="top" class="value"><a href="http://${courierInstance.web}" target="new">${courierInstance.web}</a></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.telephone.label" default="Telephone" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courierInstance, field: "telephone")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courierInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.cuit.label" default="Cuit" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: courierInstance, field: "cuit")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${courierInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="courier.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${courierInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
