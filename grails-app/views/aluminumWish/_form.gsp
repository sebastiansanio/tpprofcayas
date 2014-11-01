<%@ page import="wish.AluminumWish" %>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumWishInstance, field: 'code', 'error')} required">
				<label for="code" class="control-label"><g:message code="aluminumWish.code.label" default="Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="text" name="code" required="" value="${aluminumWishInstance.code}"/>
					<span class="help-inline">${hasErrors(bean: aluminumWishInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumWishInstance, field: 'customer', 'error')} required">
				<label for="customer" class="control-label"><g:message code="aluminumWish.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
				<div class="controls">

					<g:select id="customer" name="customer.id" from="${stakeholder.Customer.list()}" optionKey="id" value="${aluminumInstance?.customer?.id}" class="many-to-one" />

					<span class="help-inline">${hasErrors(bean: aluminumWishInstance, field: 'customer', 'error')}</span>
				</div>
			</div>
			<div class="control-group fieldcontain ${hasErrors(bean: aluminumWishInstance, field: 'lintongx', 'error')} required">
				<label for="lintongx" class="control-label"><g:message code="aluminumWish.lintongx.label" default="Lintongx" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="lintongx" step="any" required="" value="${aluminumWishInstance.lintongx}"/>
					<span class="help-inline">${hasErrors(bean: aluminumWishInstance, field: 'lintongx', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: aluminumWishInstance, field: 'subtotalExtras', 'error')} ">
				<label for="subtotalExtras" class="control-label"><g:message code="aluminumWishInstance.subtotalExtra.label" default="Subtotal Extra" /></label>
				<div class="controls">
					
					<g:select name="subtotalExtras" from="${wish.SubtotalExtra.list()}" multiple="multiple" optionKey="id" size="5" value="${aluminumWishInstance?.subtotalExtras*.id}" class="many-to-many"/>	
					<span class="help-inline">${hasErrors(bean: aluminumWishInstance, field: 'subtotalExtras', 'error')}</span>
				</div>
			</div>			


			<h4><g:message code="aluminumWish.subWish.label" default="Sub Wish" /></h4>
		
			<div id="subwishes">
					 
				<g:each var="subWish" in="${aluminumWishInstance?.subWish}" status="i">
					<g:render template="subwishForm" model="['number': i, 'subWish': subWish]"/>
				</g:each>
			</div>
			
			<div style="text-align:center;">
				<a id="addSubwish" role="button" class="btn btn-primary"> <g:message code="aluminumWish.addArticle.label" default="Add Article"/> </a>
			</div>

<script>
	$(document).ready( function() {

		var numbersOfSubwishes =  ${aluminumWishInstance?.subWish?.size()}+ 0;
		
		$("#addSubwish").on( "click", function() {
			var form = $("#subwishForm").clone().removeAttr("id").removeClass("hidden");

			form.find(".subwishElement").each( function( index ) {

				var name = $(this).attr("name");
				name = name.replace(/(subWish\[)[^\]]*(\].*)/, "$1" + numbersOfSubwishes +"$2"); 	
				$(this).attr("name", name);
				$(this).attr("id", name);
				
			});
			form.appendTo("#subwishes");
			numbersOfSubwishes++;
		})

		$("#subwishes").on( "click", ".deleteSubWish", function() {
			$(this).parents(".subWish").remove();
			numbersOfSubwishes--;			
		} )

		$("#subwishes").on( "mouseenter", ".deleteSubWish", function() {
			$(this).parent().css("background-color", "rgba(16, 55, 209, 0.22)");
			$(this).parent().next().css("background-color", "rgba(16, 55, 209, 0.22)");		
		} )
		$("#subwishes").on( "mouseleave", ".deleteSubWish", function() {
			$(this).parent().css("background-color", "#fff");
			$(this).parent().next().css("background-color", "#fff");		
		} )


	})
</script>