<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
<head>
	<title>Cayas Online</title>
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="Cayas Online">
    <meta name="author"			content="Amalia y Sebastian">
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'logo.jpg')}" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'util.css')}" />
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'menuesFijo.css')}" />
	<r:require modules="jquery"/>
	<r:require modules="${session.skin ? session.skin            : 'bootstrap'}"/>
	<r:require modules="${session.skin ? session.skin + '_utils' : 'bootstrap_utils'}"/>
	<r:require module="export"/>
	<r:layoutResources />
	<g:layoutHead />
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<g:render template="/_menu/navbar"/>														

	<g:render template="/layouts/header"/>													

	<g:render template="/layouts/content_grid"/>										

	<g:if test="${ pageProperty(name:'page.footer') }">
	    <g:pageProperty name="page.footer" />
	</g:if>

	<g:if test="${ pageProperty(name:'page.include.bottom') }">
   		<g:pageProperty name="page.include.bottom" />
	</g:if>
	
	<r:layoutResources />
	
	<script type="text/javascript" src="${resource(dir:'js', file:'fixMenues.js')}"> </script>
	
</body>

</html>
