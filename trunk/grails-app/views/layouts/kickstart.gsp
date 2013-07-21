<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'logo.jpg')}" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'docs.css')}" />
	<r:require modules="jquery"/>
	<r:require modules="${session.skin ? session.skin            : 'bootstrap'}"/>
	<r:require modules="${session.skin ? session.skin + '_utils' : 'bootstrap_utils'}"/>
	<r:require module="export"/>
	

	<r:layoutResources />
	<g:layoutHead />

</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<g:render template="/_menu/navbar"/>														

	<!-- Enable to overwrite Header by individual page -->
	<g:if test="${ pageProperty(name:'page.header') }">
   		<g:pageProperty name="page.header" />
	</g:if>
	<g:else>
		<g:render template="/layouts/header"/>														
	</g:else>

	<!-- use different templates for HTML structure based on layout (e.g., grid or fluid; Default is grid) -->
	<g:if test="${session.layout == 'fluid'}">
		<g:render template="/layouts/content_${session.layout}"/>														
	</g:if>
	<g:else>
		<g:render template="/layouts/content_grid"/>														
	</g:else>

	<!-- Enable to overwrite Footer by individual page -->
	<g:if test="${ pageProperty(name:'page.footer') }">
	    <g:pageProperty name="page.footer" />
	</g:if>
	<g:else>
		<g:render template="/layouts/footer"/>														
	</g:else>

	<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
	<g:if test="${ pageProperty(name:'page.include.bottom') }">
   		<g:pageProperty name="page.include.bottom" />
	</g:if>
	
	<r:layoutResources />
	
	<script type="text/javascript" src="${resource(dir:'js', file:'applicationFixes.js')}"> </script>
	
</body>

</html>