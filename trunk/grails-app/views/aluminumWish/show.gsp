
<%@ page import="wish.AluminumWish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminumWish.label', default: 'AluminumWish')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-aluminumWish" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumWish.lintongx.label" default="Lintongx" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: aluminumWishInstance, field: "lintongx")}</td>
				
			</tr>
		
			<tr class="prop">
				<td colspan="2">
					<g:render template="subwishShow" collection="${aluminumWishInstance.subWish}" var="aluminumSubWishInstance"/>
				</td>
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
