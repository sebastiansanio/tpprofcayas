
<%@ page import="modal.PriceCondition" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'priceCondition.label', default: 'PriceCondition')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-priceCondition" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceCondition.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: priceConditionInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceCondition.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: priceConditionInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="priceCondition.wishes.label" default="Wishes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${priceConditionInstance.wishes}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
