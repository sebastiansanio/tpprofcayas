<%@ page import="wish.AluminumSubWish" %>

<h3><g:link controller="aluminum" action="show" id="${aluminumSubWishInstance?.aluminum?.id}">${aluminumSubWishInstance?.aluminum?.encodeAsHTML()}</g:link></h3>

<table class="extras">
	<tbody>
		<tr>
			<td> <g:message code="aluminumSubWish.quantityPCS.label" default="Quantity PCS" /> </td>
			<td class="text-right"> ${fieldValue(bean: aluminumSubWishInstance, field: "quantityPCS")}</td>
		</tr>
		<tr>
			<td> <g:message code="aluminumSubWish.totalTheoricalWeight.label" default="Total Theorical Weight" /> </td>
			<td class="text-right"> <g:formatNumber number="${aluminumSubWishInstance.totalTheoricalWeight}" type="number" maxFractionDigits="4" /> </td>
		</tr>
		<tr>
			<td> <g:message code="aluminumSubWish.estimatedGW.label" default="Estimated G.W. PCS" /> </td>
			<td class="text-right"> <g:formatNumber number="${aluminumSubWishInstance.estimatedGW}" type="number" maxFractionDigits="4" /> </td>
		</tr>
	</tbody>
</table>

<hr>

<g:if test="${aluminumSubWishInstance?.extras?.size() != 0 }">
<table class="extras">
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
			<td class="text-right"> <g:formatNumber number="${extra.getTotal(aluminumSubWishInstance?.aluminum)}" type="number" maxFractionDigits="2" /> </td>
		</tr>
		</g:each>
		<tr class="subtotalResult">
			<td> Subtotal </td>
			<td class="text-right"> <g:formatNumber number="${aluminumSubWishInstance.subtotal}" type="number" maxFractionDigits="2" />  </td>
		</tr>
		<tr class="subtotalResult">
			<td> Packing </td>
			<td class="text-right"> <g:formatNumber number="${aluminumSubWishInstance.packing}" type="number" maxFractionDigits="2" />  </td>
		</tr>

		<tr class="totalResult">
			<td> <g:message code="aluminumSubWish.totalFob.label" default="Total U\$S x Kg including packing"/>   </td>
			<td class="text-right"> <g:formatNumber number="${aluminumSubWishInstance.total}" type="number" maxFractionDigits="4" />  </td>
		</tr>
		<tr class="totalResult">
			<td> U$S Price x Piece </td>
			<td class="text-right"> <g:formatNumber number="${aluminumSubWishInstance.priceXpiece}" type="number" maxFractionDigits="4" />  </td>
		</tr>
	</tbody>
</table>
</g:if>

<hr>