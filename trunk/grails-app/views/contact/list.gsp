
<%@ page import="stakeholder.Contact" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-contact" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'contact.name.label', default: 'Name')}" />

				<g:sortableColumn property="stakeholder" title="${message(code: 'contact.stakeholder.label', default: 'Stakeholder')}" />

			
				<g:sortableColumn property="email" title="${message(code: 'contact.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="position" title="${message(code: 'contact.position.label', default: 'Position')}" />
			
				<g:sortableColumn property="birthday" title="${message(code: 'contact.birthday.label', default: 'Birthday')}" />
			
				<g:sortableColumn property="phone" title="${message(code: 'contact.phone.label', default: 'Phone')}" />

				<g:sortableColumn property="extensionNumber" title="${message(code: 'contact.extensionNumber.label', default: 'Extension Number')}" />
			
				<g:sortableColumn property="cellPhone" title="${message(code: 'contact.cellPhone.label', default: 'Cell Phone')}" />
			
			
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${contactInstanceList}" status="i" var="contactInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "name")}</g:link></td>

				<td><g:link controller="${contactInstance?.stakeholder?.type}" action="show" id="${contactInstance?.stakeholder?.id}">${fieldValue(bean: contactInstance, field: "stakeholder")}</g:link></td>

			
				<td>${fieldValue(bean: contactInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: contactInstance, field: "position")}</td>
			
				<td><g:formatDate date="${contactInstance.birthday}" /></td>
			
				<td>${fieldValue(bean: contactInstance, field: "phone")}</td>
				
				<td>${fieldValue(bean: contactInstance, field: "extensionNumber")}</td>
			
				<td>${fieldValue(bean: contactInstance, field: "cellPhone")}</td>
				
				
				
				
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${contactInstanceTotal}" />
	</div>
</section>

</body>

</html>
