
<%@ page import="modal.PaymentTerm" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentTerm.label', default: 'PaymentTerm')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-paymentTerm" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'paymentTerm.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'paymentTerm.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${paymentTermInstanceList}" status="i" var="paymentTermInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${paymentTermInstance.id}">${fieldValue(bean: paymentTermInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: paymentTermInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${paymentTermInstanceTotal}" />
	</div>
</section>

</body>

</html>
