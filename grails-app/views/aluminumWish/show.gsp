
<%@ page import="wish.AluminumWish" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'aluminumWish.label', default: 'AluminumWish')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'aluminum.css')}" />
	
</head>

<body>

<section id="show-aluminumWish" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumWish.code.label" default="Code" /></td>
				
				<td valign="top" class="text-right">${fieldValue(bean: aluminumWishInstance, field: "code")}</td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumWish.supplier.label" default="Supplier" /> </td>
				
				<td valign="top" class="text-right"><g:link controller="supplier" action="show" id="${aluminumWishInstance.supplier.id}">${fieldValue(bean: aluminumWishInstance, field: "supplier")}</g:link></td>
				
			</tr>			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumWish.customer.label" default="Customer" /> </td>
				
				<td valign="top" class="text-right"><g:link controller="customer" action="show" id="${aluminumWishInstance.customer.id}">${fieldValue(bean: aluminumWishInstance, field: "customer")}</g:link></td>
				
			</tr>			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumWish.lintongx.label" default="Lintongx" /></td>
				
				<td valign="top" class="text-right">${fieldValue(bean: aluminumWishInstance, field: "lintongx")}</td>
				
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="aluminumWish.subtotalExtra.label" default="Subtotal Extra" /></td>
				
				<td valign="top">
					<ul>
					<g:each in="${aluminumWishInstance?.subtotalExtras}" var="extra">
						<li> ${extra} </li>
					</g:each>
					</ul>
				</td>
				
			</tr>

			<tr class="prop">
				<td colspan="2">
					<g:render template="subwishShow" collection="${aluminumWishInstance.subWish}" var="aluminumSubWishInstance"/>
				</td>
			</tr>

			<tr class="finalTotal">
				<td> <g:message code="aluminumWish.fob.without.packing.label" default="FOB SHENZHEN WITHOUT packing"/> </td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.fobShenzhenWithoutPacking}" type="number" maxFractionDigits="2" />  </td>
			</tr>
			<tr class="finalTotal">
				<td> <g:message code="aluminumWish.fob.with.packing.label" default="FOB SHENZHEN with packing"/> </td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.fobShenzhenWithPacking}" type="number" maxFractionDigits="2" />  </td>
			</tr>
			<tr>
				<td></td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.differentBetweenWithAndWithoutPacking}" type="number" maxFractionDigits="2" />  </td>
			</tr>
			<tr>
				<td> <g:message code="aluminumWish.amount.chinesse.label" default="Amount to be declare at Chinesse custom"/> </td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.amountToBeDeclareAtChinesseCustom}" type="number" maxFractionDigits="2" />  </td>
			</tr>
			<tr>
				<td> <g:message code="aluminumWish.diffent.label" default="Different"/> </td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.different}" type="number" maxFractionDigits="2" />  </td>
			</tr>
			<tr>
				<td> <g:message code="aluminumWish.discount.label" default="Discount 10%"/> </td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.discountXextras}" type="number" maxFractionDigits="2" />  </td>
			</tr>
			<tr class="finalTotal">
				<td> <g:message code="aluminumWish.diffentFinal.label" default="Different Gross"/> </td>
				<td class="text-right"> <g:formatNumber number="${aluminumWishInstance.netFinalDifference}" type="number" maxFractionDigits="2" />  </td>
			</tr>


		</tbody>
	</table>
</section>

</body>

</html>
