<%@ page import="wish.AluminumSubWish" %>
<%@ page import="product.Aluminum" %>

<div id="subwishForm" class="subWish">
	<div style="text-align:right;padding-bottom:20px;" >
		<g:if test="${subWish == null}">
			<a role="button" class="btn btn-primary deleteSubWish"> <g:message code="default.button.delete.label" defualt="Delete"/> </a>
		</g:if>
		<g:else>
			<g:link action='deleteSubWish' id="${subWish.id}" class="btn btn-primary"> <g:message code="default.button.delete.label" defualt="Delete"/>  </g:link>
		</g:else>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<div class="control-group fieldcontain ${hasErrors(bean: subWish, field: 'aluminum', 'error')} required">
				<label for="aluminum" class="control-label"><g:message code="aluminumSubWish.aluminum.label" default="Aluminum" /><span class="required-indicator">*</span></label>
				<div class="controls">

					<g:if test="${subWish == null}">
						<g:select name="subWish[${number}].aluminum.id" from="${Aluminum.findAllBySupplier( supplier )}" optionKey="id" required="" value="${subWish?.aluminum?.id}" class="many-to-one subwishElement"/>
					</g:if>
					<g:else>
						<g:select name="subWish[${number}].aluminum.id" from="${Aluminum.findAllBySupplier(subWish?.aluminum?.supplier )}" optionKey="id" required="" value="${subWish?.aluminum?.id}" class="many-to-one subwishElement"/>
					</g:else>
					<span class="help-inline">${hasErrors(bean: subWish, field: 'aluminum', 'error')}</span>
				</div>
			</div>
			<div class="control-group fieldcontain ${hasErrors(bean: subWish, field: 'quantityPCS', 'error')} required">
				<label for="quantityPCS" class="control-label"><g:message code="aluminumSubWish.quantityPCS.label" default="Quantity PCS" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="subWish[${number}].quantityPCS" min="1" required="" value="${subWish?.quantityPCS}" class="subwishElement"/>
					<span class="help-inline">${hasErrors(bean: subWish, field: 'quantityPCS', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subWish, field: 'factorEstimated', 'error')}" required>
				<label for="factorEstimated" class="control-label"><g:message code="aluminumSubWish.factorEstimated.label" default="Factor Estimated" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="subWish[${number}].factorEstimated" step="0.0001" min="1.0000" required="" value="${(!subWish?.factorEstimated)? '1.03' : subWish?.factorEstimated}" class="subwishElement"/>
					<span class="help-inline">${hasErrors(bean: subWish, field: 'factorEstimated', 'error')}</span>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="control-group fieldcontain ${hasErrors(bean: subWish, field: 'extras', 'error')} ">
				<label for="extras" class="control-label"><g:message code="aluminumSubWish.extra.label" default="Extra" /></label>
				<div class="controls">
					<g:if test="${subWish == null}">
						<g:select name="subWish[${number}].extras.id" from="${product.Extra.list()}" multiple="multiple" optionKey="id" size="5" value="${supplier?.extrasDefault*.id}" class="many-to-many subwishElement"/>			
					</g:if>
					<g:else>
						<g:select name="subWish[${number}].extras.id" from="${product.Extra.list()}" multiple="multiple" optionKey="id" size="5" value="${subWish?.extras*.id}" class="many-to-many subwishElement"/>			
					</g:else>	
					<span class="help-inline">${hasErrors(bean: subWish, field: 'extras', 'error')}</span>
				</div>
			</div>

		</div>
	</div>
</div>	