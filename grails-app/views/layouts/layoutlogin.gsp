<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
	<title>Cayas Online</title>
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="Cayas Online">
    <meta name="author"			content="Amalia y Sebastian">
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'logo.jpg')}" type="image/x-icon" />
	<r:require modules="jquery, ${session.skin ? session.skin : 'bootstrap'}, bootstrap_utils"/>
	<r:layoutResources />
	<g:layoutHead />
</head>

<body>
	<g:render template="/_menu/navbar"/>														
	<g:render template="/layouts/header"/>												
	<g:render template="/layouts/contentlogin"/>															
<r:layoutResources />
<script src="${resource(dir:'js',			file:'application.js')}"></script>
</body>
</html>