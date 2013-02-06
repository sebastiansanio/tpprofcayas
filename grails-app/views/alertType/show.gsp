
<%@ page import="alert.AlertType" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'alertType.label', default: 'AlertType')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-alertType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertType.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertTypeInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertType.nameOfEstimatedDateField.label" default="Name Of Estimated Date Field" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertTypeInstance, field: "nameOfEstimatedDateField")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertType.nameOfCompletionField.label" default="Name Of Completion Field" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertTypeInstance, field: "nameOfCompletionField")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertType.alertTerm.label" default="Alert Term" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertTypeInstance, field: "alertTerm")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertType.alerts.label" default="Alerts" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${alertTypeInstance.alerts}" var="a">
						<li><g:link controller="alert" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="alertType.frequency.label" default="Frequency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: alertTypeInstance, field: "frequency")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
