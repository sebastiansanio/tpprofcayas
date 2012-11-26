<div id="Content" class="container">


	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message}">
		<div class="alert alert-error">${flash.message}</div>
	</g:if>

	<!-- Show page's content -->
	<g:layoutBody />
	<g:pageProperty name="page.body" />
</div>
