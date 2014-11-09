<div id="Content" class="container-fluid">
	<div class="row-fluid">

		<!-- Main menu on the left side (e.g., controller entry points) -->
		<div class="span2">
			<g:render template="/_menu/menubar"/>														
		</div>

		<!-- Main content on the right side -->

		<!-- Secondary menu in one line (e.g., actions for current controller) -->
		<div class="span2 bs-docs-sidebar">
			<g:render template="/_menu/submenubar"/>														
		</div>
		
		<div class="span8">
			<g:render template="/_common/modals/deleteDialog" model="[item: item]"/>
			<!-- print system messages (infos, warnings, etc) - not validation errors -->
			<g:if test="${flash.message}">
				<div class="alert alert-info">${flash.message}</div>
			</g:if>
		
			<!-- Show page's content -->
			<g:layoutBody />
			<g:pageProperty name="page.body" />
		</div>
	</div>
</div>
