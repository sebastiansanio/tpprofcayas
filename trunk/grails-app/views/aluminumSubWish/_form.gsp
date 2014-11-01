<%@ page import="wish.AluminumSubWish" %>



			<div class="control-group fieldcontain ${hasErrors(bean: aluminumSubWishInstance, field: 'quantityPCS', 'error')} required">
				<label for="quantityPCS" class="control-label"><g:message code="aluminumSubWish.quantityPCS.label" default="Quantity PCS" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="quantityPCS" min="1" required="" value="${aluminumSubWishInstance.quantityPCS}"/>
					<span class="help-inline">${hasErrors(bean: aluminumSubWishInstance, field: 'quantityPCS', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumSubWishInstance, field: 'factorEstimated', 'error')} required">
				<label for="factorEstimated" class="control-label"><g:message code="aluminumSubWish.factorEstimated.label" default="Factor Estimated" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="factorEstimated" step="0.01" min="1.00" required="" value="${aluminumSubWishInstance.factorEstimated}"/>
					<span class="help-inline">${hasErrors(bean: aluminumSubWishInstance, field: 'factorEstimated', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumSubWishInstance, field: 'aluminum', 'error')} required">
				<label for="aluminum" class="control-label"><g:message code="aluminumSubWish.aluminum.label" default="Aluminum" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="aluminum" name="aluminum.id" from="${product.Aluminum.list()}" optionKey="id" required="" value="${aluminumSubWishInstance?.aluminum?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: aluminumSubWishInstance, field: 'aluminum', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumSubWishInstance, field: 'extras', 'error')} ">
				<label for="extras" class="control-label"><g:message code="aluminumSubWish.extras.label" default="Extras" /></label>
				<div class="controls">
					<g:select name="extras" from="${product.Extra.list()}" multiple="multiple" optionKey="id" size="5" value="${aluminumSubWishInstance?.extras*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: aluminumSubWishInstance, field: 'extras', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumSubWishInstance, field: 'wish', 'error')} required">
				<label for="wish" class="control-label"><g:message code="aluminumSubWish.wish.label" default="Wish" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="wish" name="wish.id" from="${wish.AluminumWish.list()}" optionKey="id" required="" value="${aluminumSubWishInstance?.wish?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: aluminumSubWishInstance, field: 'wish', 'error')}</span>
				</div>
			</div>

