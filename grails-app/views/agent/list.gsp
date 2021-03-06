
<%@ page import="stakeholder.Agent" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agent.label', default: 'Agent')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-agent" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'agent.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'agent.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'agent.email.label', default: 'Email')}" />
			
				<th><g:message code="stakeholder.defaultReport.label" default="Default Report" /></th>
			
				<th><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></th>
			
				<th><g:message code="agent.country.label" default="Country" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${agentInstanceList}" status="i" var="agentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${agentInstance.id}">${fieldValue(bean: agentInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: agentInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: agentInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: agentInstance, field: "defaultReport")}</td>
			
				<td>${fieldValue(bean: agentInstance, field: "defaultLocale")}</td>
			
				<td>${fieldValue(bean: agentInstance, field: "country")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${agentInstanceTotal}" />
	</div>
</section>

</body>

</html>
