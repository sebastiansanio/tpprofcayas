<%@ page import="wish.AluminumSubWish" %>

<h3><g:link controller="aluminum" action="show" id="${aluminumSubWishInstance?.aluminum?.id}">${aluminumSubWishInstance?.aluminum?.encodeAsHTML()}</g:link></h3>

<p> <g:message code="aluminumSubWish.quantityPCS.label" default="Quantity PCS" />: ${fieldValue(bean: aluminumSubWishInstance, field: "quantityPCS")} </p>

<g:if test="${aluminumSubWishInstance?.extras?.size() != 0 }">
<table>
	<thead>
		<tr>
			<th><g:message code="aluminumSubWish.extra.label" default="Extra" /></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${aluminumSubWishInstance.extras}" var="extra">
		<tr>
			<td> <g:link controller="extra" action="show" id="${extra.id}">${extra?.encodeAsHTML()}</g:link> </td>
			<td> ${extra.getTotal(aluminumSubWishInstance?.aluminum)}</td>
		</tr>
		</g:each>
		<tr>
			<td> Subtotal </td>
			<td> ${aluminumSubWishInstance.getSubtotal()} </td>
		</tr>
	</tbody>
</table>
</g:if>