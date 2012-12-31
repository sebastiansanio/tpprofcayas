<ul class="nav pull-right">
	<li class="dropdown dropdown-btn">
<%--<sec:ifNotLoggedIn>--%>
<shiro:isNotLoggedIn>

		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#" tabindex="-1">
			<!-- TODO: integrate Springsource Security etc. and show User's name ... -->
			<g:message code="default.signin.label"/><b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<g:form controller="auth" action="signIn" method="post" accept-charset="UTF-8">
					<input style="margin-bottom: 15px;" type="text" placeholder="${message(code: 'default.username.label')}" id="username" name="username">
					<input style="margin-bottom: 15px;" type="password" placeholder="${message(code: 'default.password.label')}" id="password" name="password">
					<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="${message(code: 'default.signin.label')}">
				</g:form>
			</li>

		</ul>

<%--</sec:ifNotLoggedIn>--%>
</shiro:isNotLoggedIn>
<%--<sec:ifLoggedIn>--%>
<shiro:isLoggedIn>
<a href="${createLink(controller:'auth',action:'signOut')}">
${message(code: 'default.signout.label')}
</a>
</shiro:isLoggedIn>

<%--</sec:ifLoggedIn>--%>
	</li>
</ul>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="show"><g:message code="default.user.unknown.label"/></g:link>
	</li>
</ul>
</noscript>
