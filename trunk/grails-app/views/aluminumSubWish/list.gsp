
<%@ page import="wish.AluminumSubWish" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminumSubWish.label', default: 'AluminumSubWish')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-aluminumSubWish" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="quantityPCS" title="${message(code: 'aluminumSubWish.quantityPCS.label', default: 'Quantity PCS')}" />
			
				<g:sortableColumn property="factorEstimated" title="${message(code: 'aluminumSubWish.factorEstimated.label', default: 'Factor Estimated')}" />
			
				<th><g:message code="aluminumSubWish.aluminum.label" default="Aluminum" /></th>
			
				<th><g:message code="aluminumSubWish.wish.label" default="Wish" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${aluminumSubWishInstanceList}" status="i" var="aluminumSubWishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${aluminumSubWishInstance.id}">${fieldValue(bean: aluminumSubWishInstance, field: "quantityPCS")}</g:link></td>
			
				<td>${fieldValue(bean: aluminumSubWishInstance, field: "factorEstimated")}</td>
			
				<td>${fieldValue(bean: aluminumSubWishInstance, field: "aluminum")}</td>
			
				<td>${fieldValue(bean: aluminumSubWishInstance, field: "wish")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${aluminumSubWishInstanceTotal}" />
	</div>
</section>

</body>

</html>
