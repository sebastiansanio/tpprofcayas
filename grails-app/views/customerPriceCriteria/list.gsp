
<%@ page import="prices.CustomerPriceCriteria" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-customerPriceCriteria" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="comission" title="${message(code: 'customerPriceCriteria.comission.label', default: 'Comission')}" />
			
				<th><g:message code="customerPriceCriteria.customerGroup.label" default="Customer Group" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'customerPriceCriteria.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="extra1" title="${message(code: 'customerPriceCriteria.extra1.label', default: 'Extra1')}" />
			
				<g:sortableColumn property="extra2" title="${message(code: 'customerPriceCriteria.extra2.label', default: 'Extra2')}" />
			
				<th><g:message code="customerPriceCriteria.family.label" default="Family" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerPriceCriteriaInstanceList}" status="i" var="customerPriceCriteriaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customerPriceCriteriaInstance.id}">${fieldValue(bean: customerPriceCriteriaInstance, field: "comission")}</g:link></td>
			
				<td>${fieldValue(bean: customerPriceCriteriaInstance, field: "customerGroup")}</td>
			
				<td><g:formatDate date="${customerPriceCriteriaInstance.dateCreated}" /></td>
			
				<td>${fieldValue(bean: customerPriceCriteriaInstance, field: "extra1")}</td>
			
				<td>${fieldValue(bean: customerPriceCriteriaInstance, field: "extra2")}</td>
			
				<td>${fieldValue(bean: customerPriceCriteriaInstance, field: "family")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${customerPriceCriteriaInstanceTotal}" />
	</div>
</section>

</body>

</html>
