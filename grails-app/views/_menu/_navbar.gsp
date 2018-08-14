<div class="navbar navbar-fixed-top">
	<div id="Header" class="navbar-inner">
		<div class="container">
			<a class="brand" href="${createLink(uri: '/')}">
				
				<img style="height:20px;" src="${resource(dir:'images',file:'logo2.png')}" alt="Cayas Online" />
				
			</a>
       		<div>
	  			<div class="pull-right">
	  				<g:render template="/_menu/user"/>	
					<g:render template="/_menu/language"/>	
					${meta(name:'app.version')}						
	  			</div>
			</div>
		</div>
	</div>
</div>
