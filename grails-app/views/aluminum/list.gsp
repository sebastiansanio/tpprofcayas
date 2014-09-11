
<%@ page import="product.Aluminum" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminum.label', default: 'Aluminum')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-aluminum" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="descriptionSP" title="${message(code: 'aluminum.descriptionSP.label', default: 'Description SP')}" />
			
				<g:sortableColumn property="descriptionEN" title="${message(code: 'aluminum.descriptionEN.label', default: 'Description EN')}" />
			
				<th><g:message code="aluminum.supplier.label" default="Supplier" /></th>
			
				<g:sortableColumn property="netWeightPerBox" title="${message(code: 'aluminum.netWeightPerBox.label', default: 'Net Weight Per Box')}" />
			
				<g:sortableColumn property="grossWeightPerBox" title="${message(code: 'aluminum.grossWeightPerBox.label', default: 'Gross Weight Per Box')}" />
			
				<g:sortableColumn property="cayasCode" title="${message(code: 'aluminum.cayasCode.label', default: 'Cayas Code')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${aluminumInstanceList}" status="i" var="aluminumInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${aluminumInstance.id}">${fieldValue(bean: aluminumInstance, field: "descriptionSP")}</g:link></td>
			
				<td>${fieldValue(bean: aluminumInstance, field: "descriptionEN")}</td>
			
				<td>${fieldValue(bean: aluminumInstance, field: "supplier")}</td>
			
				<td>${fieldValue(bean: aluminumInstance, field: "netWeightPerBox")}</td>
			
				<td>${fieldValue(bean: aluminumInstance, field: "grossWeightPerBox")}</td>
			
				<td>${fieldValue(bean: aluminumInstance, field: "cayasCode")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${aluminumInstanceTotal}" />
	</div>
</section>

</body>

</html>
