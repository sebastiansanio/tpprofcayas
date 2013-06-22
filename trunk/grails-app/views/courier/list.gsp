
<%@ page import="courier.Courier" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'courier.label', default: 'Courier')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-courier" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'courier.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="web" title="${message(code: 'courier.web.label', default: 'Web')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'courier.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'courier.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="cuit" title="${message(code: 'courier.cuit.label', default: 'Cuit')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'courier.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${courierInstanceList}" status="i" var="courierInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${courierInstance.id}">${fieldValue(bean: courierInstance, field: "name")}</g:link></td>
			
				<td><a href="http://${courierInstance.web}" target="new">${courierInstance.web}</a></td>
			
				<td>${fieldValue(bean: courierInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: courierInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: courierInstance, field: "cuit")}</td>
			
				<td><g:formatDate date="${courierInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${courierInstanceTotal}" />
	</div>
</section>

</body>

</html>
