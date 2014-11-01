
<%@ page import="wish.AluminumSubWish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminumSubWish.label', default: 'AluminumSubWish')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-aluminumSubWish" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumSubWish.quantityPCS.label" default="Quantity PCS" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumSubWishInstance, field: "quantityPCS")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumSubWish.factorEstimated.label" default="Factor Estimated" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumSubWishInstance, field: "factorEstimated")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumSubWish.aluminum.label" default="Aluminum" /></td>
				
				<td valign="top" class="value"><g:link controller="aluminum" action="show" id="${aluminumSubWishInstance?.aluminum?.id}">${aluminumSubWishInstance?.aluminum?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumSubWish.extras.label" default="Extras" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${aluminumSubWishInstance.extras}" var="e">
						<li><g:link controller="extra" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumSubWish.wish.label" default="Wish" /></td>
				
				<td valign="top" class="value"><g:link controller="aluminumWish" action="show" id="${aluminumSubWishInstance?.wish?.id}">${aluminumSubWishInstance?.wish?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
