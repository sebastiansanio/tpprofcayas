
<%@ page import="modal.PaymentStatus" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paymentStatus.label', default: 'PaymentStatus')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-paymentStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentStatus.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentStatusInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentStatus.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paymentStatusInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paymentStatus.whishes.label" default="Whishes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${paymentStatusInstance.whishes}" var="w">
						<li><g:link controller="wish" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
