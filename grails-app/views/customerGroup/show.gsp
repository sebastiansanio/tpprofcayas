
<%@ page import="prices.CustomerGroup" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerGroup.label', default: 'CustomerGroup')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-customerGroup" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerGroup.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customerGroupInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerGroup.customers.label" default="Customers" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${customerGroupInstance.customers}" var="c">
						<li><g:link controller="customer" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerGroup.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${customerGroupInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customerGroup.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${customerGroupInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
