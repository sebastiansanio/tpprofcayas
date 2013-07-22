<div id="Content" class="container">

	<!-- Main menu in one line (e.g., controller entry points -->
	<div id="panelMenuPpal" class="row">
		<div class="span12">
			<g:render template="/_menu/menubar"/>
		</div>
	</div>
	
	<div id="panelSubMenu" class="row">
		<!-- Secondary menu in one line (e.g., actions for current controller) -->
		<div class="span2">
			<g:render template="/_menu/submenubar"/>														
		</div>
		
		<div class="span10">
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
