
<%@ page import="modal.AvailableLocale" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'availableLocale.label', default: 'AvailableLocale')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-availableLocale" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="country" title="${message(code: 'availableLocale.country.label', default: 'Country')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'availableLocale.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="language" title="${message(code: 'availableLocale.language.label', default: 'Language')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'availableLocale.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${availableLocaleInstanceList}" status="i" var="availableLocaleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${availableLocaleInstance.id}">${fieldValue(bean: availableLocaleInstance, field: "country")}</g:link></td>
			
				<td><g:formatDate date="${availableLocaleInstance.dateCreated}" /></td>
			
				<td>${fieldValue(bean: availableLocaleInstance, field: "language")}</td>
			
				<td><g:formatDate date="${availableLocaleInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${availableLocaleInstanceTotal}" />
	</div>
</section>

</body>

</html>
