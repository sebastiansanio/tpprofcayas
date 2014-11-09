<%@ page import="alert.Alert" %>
<%@ page import="login.User" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alert.label', default: 'Alert')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-alert" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
				<g:sortableColumn property="attentionDate" title="${message(code: 'alert.attentionDate.label', default: 'Attention Date')}" />

				<g:sortableColumn property="deadline" title="${message(code: 'alert.deadline.label', default: 'Deadline')}" />

				<th><g:message code="alert.alertType.label" default="Alert Type" /></th>

				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('opNumber')}">				
					<g:sortableColumn property="wish.opNumber" title="${message(code: 'wish.opNumber.label')}" />
				</g:if>
				
				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('customerOpNumber')}">	
					<g:sortableColumn property="wish.customerOpNumber" title="${message(code: 'wish.customerOpNumber.label')}" />
				</g:if>
						
				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('customer')}">				
					<th><g:message code="wish.customer.label" default="Customer" /></th>
				</g:if>

				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('supplier')}">				
					<th><g:message code="wish.supplier.label" default="Supplier" /></th>
				</g:if>

				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('supplierOrder')}">				
					<th><g:message code="wish.supplierOrder.label" default="Supplier Order" /></th>
				</g:if>
						
			</tr>
		</thead>
		<tbody>
		<g:each in="${alertInstanceList}" status="i" var="alertInstance">
		
			<tr class="${alertInstance.isActive() && !alertInstance.isInspected() && alertInstance.attentionDate.compareTo(new Date().clearTime())<=0 ? 'error' :((i % 2) == 0 ? 'odd' : 'even')}">

				<td><g:formatDate date="${alertInstance.attentionDate}" /></td>

				<td><g:formatDate date="${alertInstance.deadline}" /></td>				
			
				<td>${alertInstance.alertType.externalMessage}</td>

				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('opNumber')}">					
					<td><g:link action="show" controller="wishExternal" params="[customerId:alertInstance.wish.customer.id,customerOpNumber:alertInstance.wish.customerOpNumber]">${alertInstance.wish.opNumber}</g:link></td>
				</g:if>

				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('customerOpNumber')}">	
					<td><g:link action="show" controller="wishExternal" params="[customerId:alertInstance.wish.customer.id,customerOpNumber:alertInstance.wish.customerOpNumber]">${alertInstance.wish.customerOpNumber}</g:link></td>
				</g:if>
				
				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('customer')}">				
					<td>${alertInstance.wish.customer}</td>
				</g:if>
				
				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('supplier')}">				
					<td>${alertInstance.wish.supplier}</td>
				</g:if>
				
				<g:if test="${user.stakeholder?.defaultReport?.fields?.contains('supplierOrder')}">				
					<td>${alertInstance.wish.supplierOrder}</td>
				</g:if>
				
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${alertInstanceTotal}" />
	</div>
</section>


</body>

</html>
