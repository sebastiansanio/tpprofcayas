<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			<i class="icon-cog icon-large icon-white"></i>
		</a>
		<ul class="dropdown-menu">
			<li class="controller">
				<a tabindex="-1" href="#"><b>${message(code: 'visualstyle.label')}</b></a>
			</li>
			<li class="dropdown-submenu">
				<a href="#" class="dropdown-toggle">
					<i class="${params.layout == 'fluid' ? 'icon-resize-full' : 'icon-resize-vertical'}"></i>
					<span class="js-current-language">${layout ? layout.toString().toUpperCase() : "${message(code: 'default.layout.label', default: 'Layout')}"}</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-dark">
					<li><a class="" title="Vertical" href="${request.forwardURI+'?layout=grid'}">
						<i class="icon-resize-vertical"></i>
						<g:message code="default.layout.fluid.label" default="Grid 940px (Menu Top)"/>
					</a></li>
					<li><a class="" title="Horizontal" href="${request.forwardURI+'?layout=fluid'}">
						<i class="icon-resize-full"></i>
						<g:message code="default.layout.fluid.label" default="Fluid (Menu Left)"/>
					</a></li>
				</ul>
			</li>
		</ul>
	</li>
</ul>