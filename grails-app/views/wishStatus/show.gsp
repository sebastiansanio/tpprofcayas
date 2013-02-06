
<%@ page import="modal.WishStatus" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wishStatus.label', default: 'WishStatus')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-wishStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wishStatus.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishStatusInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wishStatus.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: wishStatusInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="wishStatus.whishes.label" default="Whishes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${wishStatusInstance.whishes}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
