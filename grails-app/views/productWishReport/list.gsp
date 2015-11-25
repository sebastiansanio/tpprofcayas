
<%@ page import="report.ProductWishReport" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productWishReport.label', default: 'ProductWishReport')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-productWishReport" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'productWishReport.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'productWishReport.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'productWishReport.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productWishReportInstanceList}" status="i" var="productWishReportInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productWishReportInstance.id}">${fieldValue(bean: productWishReportInstance, field: "name")}</g:link></td>
			
				<td><g:formatDate date="${productWishReportInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${productWishReportInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productWishReportInstanceTotal}" />
	</div>
</section>

</body>

</html>
