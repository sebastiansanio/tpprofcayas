<ul class="nav pull-right">
	<li class="dropdown dropdown-btn">
<shiro:isNotLoggedIn>
		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#" tabindex="-1">
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
</shiro:isNotLoggedIn>
<shiro:isLoggedIn>
<a href="${createLink(controller:'auth',action:'signOut')}">
${message(code: 'default.signout.label')}
</a>
</shiro:isLoggedIn>
	</li>
</ul>
