
<%@ page import="wish.AluminumWish" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminumWish.label', default: 'AluminumWish')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-aluminumWish" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>

				<g:sortableColumn property="code" title="${message(code: 'aluminumWish.code.label', default: 'Code')}" />

				<th> <g:message code="aluminumWish.customer.label"default='Customer'/>	</th>

				<g:sortableColumn property="lintongx" title="${message(code: 'aluminumWish.lintongx.label', default: 'Lintongx')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${aluminumWishInstanceList}" status="i" var="aluminumWishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${aluminumWishInstance.id}">${fieldValue(bean: aluminumWishInstance, field: "code")}</g:link></td>

				<td><g:link controller="customer" action="show" id="${aluminumWishInstance.customer.id}">${fieldValue(bean: aluminumWishInstance, field: "customer")}</g:link></td>				
			
				<td>${fieldValue(bean: aluminumWishInstance, field: "lintongx")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${aluminumWishInstanceTotal}" />
	</div>
</section>

</body>

</html>
