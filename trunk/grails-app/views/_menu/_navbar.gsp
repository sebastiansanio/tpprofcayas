<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container">

			<a class="brand" href="${createLink(uri: '/')}">	
				<small> ${message(code:'version.label')} ${meta(name:'app.version')}</small>
			</a>

       		<div class="nav-collapse">

	  			<div class="pull-right">
					<g:render template="/_menu/language"/>														
					<g:render template="/_menu/config"/>												
					<g:render template="/_menu/user"/>													
	  			</div>

			</div>
			
		</div>
	</div>
</div>
