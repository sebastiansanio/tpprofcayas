<%@ page import="wish.Wish" %>
<%@ page import="login.User" %>

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

<g:if test="${user.stakeholder!=null}">
	<table class="table table-condensed table-bordered">
		<thead>
			<tr>
				
				<th> ${message(code:'default.view.label') }</th>
							
				<g:if test="${user.stakeholder.defaultReport.fields.contains('opNumber')}">
					<th>${message(code: 'wish.opNumber.label', default: 'Op Number')}" </th>
				</g:if>

				<g:if test="${user.stakeholder.defaultReport.fields.contains('customerOpNumber')}">			
					<th>${message(code: 'wish.customerOpNumber.label', default: 'Customer Op Number')}</th>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('customer')}">
					<th>${message(code: 'wish.customer.label', default: 'Customer')} </th>
				</g:if>

				<g:if test="${user.stakeholder.defaultReport.fields.contains('supplier')}">
					<th>${message(code: 'wish.supplier.label', default: 'Supplier')} </th>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('shipper')}">
					<th>${message(code: 'wish.shipper.label', default: 'Shipper')} </th>
				</g:if>
						
				<g:if test="${user.stakeholder.defaultReport.fields.contains('supplierOrder')}">
					<th>${message(code: 'wish.supplierOrder.label', default: 'Supplier Order')} </th>
				</g:if>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishInstanceList}" status="i" var="wishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" params="[customerId:wishInstance.customer.id,customerOpNumber:wishInstance.customerOpNumber]"> <i class="icon-eye-open"></i> </g:link></td>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('opNumber')}">
					<td>${fieldValue(bean: wishInstance, field: "opNumber")}</td>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('customerOpNumber')}">
				<td>${fieldValue(bean: wishInstance, field: "customerOpNumber")}</td>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('customer')}">
				<td>${fieldValue(bean: wishInstance, field: "customer")}</td>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('supplier')}">
				<td>${fieldValue(bean: wishInstance, field: "supplier")}</td>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('shipper')}">
				<td>${fieldValue(bean: wishInstance, field: "shipper")}</td>
				</g:if>
			
				<g:if test="${user.stakeholder.defaultReport.fields.contains('supplierOrder')}">
				<td>${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
				</g:if>
			
			</tr>
		</g:each>
		</tbody>
	</table>
</g:if>

</section>



</body>

</html>
