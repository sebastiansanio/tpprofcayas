			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.previousPrices.label" default="Previous Price" /></td>
				
				<td valign="top" class="value"> 
					
						<g:if test="${productInstance?.previousPrices?.size() > 1 }">
							<g:link action="listHistoricalPrice"  id="${productInstance?.id}">
							${productInstance?.previousPrices?.get( productInstance?.previousPrices?.size() - 2 )}
							</g:link>
						</g:if>

				</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="product.pricePerUnit.label" default="Price Per Unit" /></td>
				
				<td valign="top" class="value">
					<g:if test="${productInstance?.previousPrices?.size() != 0 }">
						${productInstance?.previousPrices?.last()}
					</g:if>
				</td>
				
			</tr>