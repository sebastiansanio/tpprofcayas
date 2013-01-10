
<%@ page import="wish.Picture" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'picture.label', default: 'Picture')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-picture" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="picture.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pictureInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="picture.image.label" default="Image" /></td>
				
				<img src="${createLink(controller: 'picture',action: 'viewPicture',id: pictureInstance.id)}" />
				

			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
