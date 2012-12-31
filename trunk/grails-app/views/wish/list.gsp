
<%@ page import="wish.Wish" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-wish" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="wish.customer.label" default="Customer" /></th>
			
				<th><g:message code="wish.supplier.label" default="Supplier" /></th>
			
				<th><g:message code="wish.shipper.label" default="Shipper" /></th>
			
				<g:sortableColumn property="afipRequirement" title="${message(code: 'wish.afipRequirement.label', default: 'Afip Requirement')}" />
			
				<th><g:message code="wish.agent.label" default="Agent" /></th>
			
				<g:sortableColumn property="amountOfMoneyInAdvanceTransferred" title="${message(code: 'wish.amountOfMoneyInAdvanceTransferred.label', default: 'Amount Of Money In Advance Transferred')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishInstanceList}" status="i" var="wishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${wishInstance.id}">${fieldValue(bean: wishInstance, field: "customer")}</g:link></td>
			
				<td>${fieldValue(bean: wishInstance, field: "supplier")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "shipper")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "afipRequirement")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "agent")}</td>
			
				<td>${fieldValue(bean: wishInstance, field: "amountOfMoneyInAdvanceTransferred")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${wishInstanceTotal}" />
	</div>
	<export:formats formats="['csv','excel','ods','pdf']"/>
	
</section>

</body>

</html>
