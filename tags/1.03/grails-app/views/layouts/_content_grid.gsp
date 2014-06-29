<div id="Content" class="container">
	<div id="panelMenuPpal" class="row">
		<div class="span12">
			<g:render template="/_menu/menubar"/>
		</div>
	</div>
	<div id="panelSubMenu" class="row">
		<div class="span2">
			<g:render template="/_menu/submenubar"/>														
		</div>		
		<div class="span10">
			<g:render template="/_common/modals/deleteDialog" model="[item: item]"/>
			<g:if test="${flash.message}">
				<div class="alert alert-info">${flash.message}</div>
			</g:if>		
			<g:layoutBody />
			<g:pageProperty name="page.body" />
		</div>
	</div>
</div>
