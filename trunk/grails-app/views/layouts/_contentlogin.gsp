<div id="Content" class="container">
	<g:if test="${flash.message}">
		<div class="alert alert-error">${flash.message}</div>
	</g:if>
	<g:layoutBody />
	<g:pageProperty name="page.body" />
</div>
