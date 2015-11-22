
<%@ page import="stakeholder.CustomerFamilyMargin" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-customerFamilyMargin" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>

				<g:sortableColumn property="customer.name" title="${message(code: 'customerFamilyMargin.customer.label')}" />

				<g:sortableColumn property="family.description" title="${message(code: 'customerFamilyMargin.family.label')}" />
			
				<g:sortableColumn property="margin" title="${message(code: 'customerFamilyMargin.margin.label', default: 'Margin')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'customerFamilyMargin.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'customerFamilyMargin.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerFamilyMarginInstanceList}" status="i" var="customerFamilyMarginInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td>${fieldValue(bean: customerFamilyMarginInstance, field: "customer")}</td>
			
				<td>${fieldValue(bean: customerFamilyMarginInstance, field: "family")}</td>
			
				<td><g:link action="show" id="${customerFamilyMarginInstance.id}">${fieldValue(bean: customerFamilyMarginInstance, field: "margin")}</g:link></td>
			
				<td><g:formatDate date="${customerFamilyMarginInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${customerFamilyMarginInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${customerFamilyMarginInstanceTotal}" />
	</div>
</section>

</body>

</html>
