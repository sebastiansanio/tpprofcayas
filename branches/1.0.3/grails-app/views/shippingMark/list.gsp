
<%@ page import="modal.ShippingMark" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'shippingMark.label', default: 'ShippingMark')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-shippingMark" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'shippingMark.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${shippingMarkInstanceList}" status="i" var="shippingMarkInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${shippingMarkInstance.id}">${fieldValue(bean: shippingMarkInstance, field: "name")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${shippingMarkInstanceTotal}" />
	</div>
</section>

</body>

</html>
