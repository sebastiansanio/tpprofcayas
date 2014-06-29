
<%@ page import="stakeholder.OtherStakeholder" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'otherStakeholder.label', default: 'OtherStakeholder')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:render template="../menuFijo"></g:render>
</head>

<body>
	
<section id="list-otherStakeholder" class="first">

	<table class="table table-bordered cabeceraFija">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'stakeholder.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="telephone" title="${message(code: 'stakeholder.telephone.label', default: 'Telephone')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'stakeholder.email.label', default: 'Email')}" />
			
				<th><g:message code="stakeholder.defaultReport.label" default="Default Report" /></th>
			
				<th><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /></th>
			
				<g:sortableColumn property="province" title="${message(code: 'stakeholder.province.label', default: 'Province')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${otherStakeholderInstanceList}" status="i" var="otherStakeholderInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${otherStakeholderInstance.id}">${fieldValue(bean: otherStakeholderInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: otherStakeholderInstance, field: "telephone")}</td>
			
				<td>${fieldValue(bean: otherStakeholderInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: otherStakeholderInstance, field: "defaultReport")}</td>
			
				<td>${fieldValue(bean: otherStakeholderInstance, field: "defaultLocale")}</td>
			
				<td>${fieldValue(bean: otherStakeholderInstance, field: "province")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${otherStakeholderInstanceTotal}" />
	</div>
</section>

</body>

</html>
