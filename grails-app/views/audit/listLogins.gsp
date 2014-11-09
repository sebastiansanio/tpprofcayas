<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'audit.label', default: 'Audit')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
		
<section id="list-loginLog" class="first">

	<table class="table table-bordered table-condensed cabeceraFija">
		<thead>
			<tr>
								
				<th><g:message code="loginLog.user.label" default="User" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'loginLog.dateCreated.label')}" />

			
			</tr>
		</thead>
		<tbody>
		<g:each in="${loginLogInstanceList}" status="i" var="loginLogInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td>${fieldValue(bean: loginLogInstance, field: "user")}</td>
			
				<td><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${loginLogInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${loginLogInstanceTotal}" />
	</div>
</section>

</body>

</html>
