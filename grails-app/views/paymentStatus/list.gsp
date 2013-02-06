
<%@ page import="modal.PaymentStatus" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentStatus.label', default: 'PaymentStatus')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-paymentStatus" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'paymentStatus.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'paymentStatus.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${paymentStatusInstanceList}" status="i" var="paymentStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${paymentStatusInstance.id}">${fieldValue(bean: paymentStatusInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: paymentStatusInstance, field: "description")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${paymentStatusInstanceTotal}" />
	</div>
</section>

</body>

</html>
