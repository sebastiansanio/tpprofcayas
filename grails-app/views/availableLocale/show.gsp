
<%@ page import="modal.AvailableLocale" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'availableLocale.label', default: 'AvailableLocale')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-availableLocale" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="availableLocale.country.label" default="Country" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: availableLocaleInstance, field: "country")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="availableLocale.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${availableLocaleInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="availableLocale.language.label" default="Language" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: availableLocaleInstance, field: "language")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="availableLocale.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${availableLocaleInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
