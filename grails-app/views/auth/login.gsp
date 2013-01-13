<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="layoutlogin" />
  <title>${message(code: 'appname.label')}</title>
</head>
<body>
<br/>
<div class="row-fluid">

<div class="span4">
  <g:form controller="auth" action="signIn">
    	
       	<div class="row-fluid">
			<label class="span8" for="username"><g:message code="default.username.label" default="Username" /></label>
       	</div>
       	<div class="row-fluid">
			<g:field class="span8" type="text" name="username" value="${username}"/>
		</div>
       
       	<div class="row-fluid">
			<label class="span8" for="username"><g:message code="default.password.label" default="Password" /></label>
		</div>
		<div class="row-fluid">
			<g:field class="span8" type="password" name="password" value=""/>
		</div>
		
		<div class="row-fluid">
			<g:actionSubmit class="span8" action="signIn" value="${message(code: 'default.signin.label', default: 'Sign in')}" />
        </div>
  </g:form>
</div>
<div class="span8">

</div>

</div>
  
</body>
</html>
