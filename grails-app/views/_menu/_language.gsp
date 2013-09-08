<g:set var="lang" value="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ?: org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().substring(0,2)}"/>
<g:set var="currentURL" value="${request.forwardURI}"/>

<ul class="nav secondary-nav language-dropdown pull-right">
	<li class="dropdown js-language-dropdown">
		<a href="javascript:;" class="dropdown-toggle">
			<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/flags',file: lang.toString()+'.png')}" />
		</a>
		<ul class="dropdown-menu dropdown-menu-dark">

			<li><a class="js-language-link" title="Español" data-lang-code="es" href="${currentURL+'?lang=es'}">
				<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/flags',file: 'es.png')}"/>
				<g:message code="language.es" default="es"/> ${currentlURL }
			</a></li>

			<li><a class="js-language-link" title="English" data-lang-code="en" href="${currentURL+'?lang=en'}">
				<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/flags',file: 'en.png')}"/>
				<g:message code="language.en" default="en"/> ${currentlURL }
			</a></li>
		</ul>
	</li>
</ul>