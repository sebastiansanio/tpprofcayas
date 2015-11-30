
<%@ page import="wish.ProductWish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'productWish.label', default: 'ProductWish')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-productWish" class="first">

	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWish.code.label" /></td>
				
				<td valign="top" class="value">${productWishInstance.code}</td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWish.customer.label" default="Customer" /></td>
				
				<td valign="top" class="value"><g:link controller="customer" action="show" id="${productWishInstance?.customer?.id}">${productWishInstance?.customer?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWish.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productWishInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="productWish.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${productWishInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>

<div class="span2">
	<h4><g:message code="export.label"  /></h4>
	<g:form action="export" method="POST">
		<g:select name="reportId" optionKey="id" value="${reportInstance?.id}" from="${report.ProductWishReport.list()}"/>
		<g:hiddenField name="id" value="${productWishInstance?.id}" />
		
		<button type="submit">
		<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
		</button>
	</g:form>
</div>
	
</section>

</body>

</html>
