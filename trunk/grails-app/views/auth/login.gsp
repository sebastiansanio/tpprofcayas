<!DOCTYPE html>
<html
	lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
<title>Cayas Online</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Cayas Online">
<meta name="author" content="Amalia y Sebastian">
<link rel="shortcut icon" href="${resource(dir:'images',file:'logo.jpg')}" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<r:require	modules="jquery, ${session.skin ? session.skin : 'bootstrap'}, bootstrap_utils" />
<r:layoutResources />

</head>
<body>

<div id="Content" class="container">

<div class="row-fluid">

	<div class="offset4 span4">
		<div style="text-align:center;margin-bottom:30px;">
		<img src="${resource(dir:'images',file:'logo-sis.jpg')}" alt="Cayas" style="height:150px;" />
		</div>
		<div class="row-fluid" style="text-align:center;margin-bottom:30px;">
		<img src="${resource(dir:'images',file:'cayas-sis.jpg')}" alt="Cayas - Commercial Advisors & Awakening Solutions" />
		</div>

		<div class="row-fluid" style="text-align:center;">
		<g:form controller="auth" action="signIn">
		<fieldset>
			<g:field placeholder="${message(code:'default.username.label')}" type="text" name="username" value="${username}" />
			<br/>
			<g:field placeholder="${message(code:'default.password.label')}" type="password" name="password" value="" />
			<br/>
			<g:if test="${flash.message}">
			<div class="alert alert-error">
				<p>${flash.message}</p>
			</div>
			</g:if>
			<g:actionSubmit class="btn btn-primary" action="signIn" value="${message(code: 'default.signin.label', default: 'Sign in')}" />
		</fieldset>
		</g:form>
		</div>
		
		<div class="row-fluid" style="text-align:center;color:#0000FF;">

		<p class="blue">
		${message(code:'data.street.message')}<br/>
		${message(code:'data.zipCode.message')}<br/>
		${message(code:'data.city.message')}<br/>
		${message(code:'data.country.message')}<br/>
		${message(code:'data.phone.message')}<br/>
		<a href="mailto:info@cayas.com.ar">info@cayas.com.ar</a> <br/>
		</p>
		</div>
		
	</div>
</div>
</div>
<r:layoutResources />

</body>
</html>
