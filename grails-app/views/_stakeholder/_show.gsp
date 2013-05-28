<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'contactStyle.css')}" />

<tr class="prop">
	<td colspan="2" valign="top" class="name">
		<g:message code="contact.label" default="Contact" />
			<g:each in="${stakeholderInstance.contacts}" var="contact">
				<div class="row-fluid contact-card">
					<div class="span6">
					 	<p> <span class="contact-label"> <g:message code="contact.name.label" default="Name" />: </span> <g:link controller="contact" action="show"  id="${contact.id}"> ${fieldValue(bean: contact, field: "name")} </g:link></p>
					 	<p> <span class="contact-label"> <g:message code="contact.email.label" default="Email" />: </span> ${fieldValue(bean: contact, field: "email")}</p>
					 	<p> <span class="contact-label"> <g:message code="contact.position.label" default="Position" />: </span> ${fieldValue(bean: contact, field: "position")}</p>
					</div>
					<div class="span6">
					 	<p> <span class="contact-label"> <g:message code="contact.sendAlerts.label" default="Send alerts?"/>: </span> ${fieldValue(bean: contact, field: "sendAlerts")}</p>
					 	<p> <span class="contact-label"> <g:message code="contact.sendReports.label" default="Send reports?" />: </span> ${fieldValue(bean: contact, field: "sendReports")}</p>
					</div>
				</div>		
				<p></p>				
			</g:each>
	</td>
</tr>