<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'contactStyle.css')}" />


<g:each in="${stakeholderInstance.contacts}" var="contact">
		<div class="contact-card">
		<div class="row-fluid">
			<div class="span5">
			 	<p> <span class="contact-label"> <g:message code="contact.name.label" default="Name" />: </span> <g:link controller="contact" action="show"  id="${contact.id}"> ${fieldValue(bean: contact, field: "name")} </g:link></p>
			 	<p> <span class="contact-label"> <g:message code="contact.email.label" default="Email" />: </span> ${fieldValue(bean: contact, field: "email")}</p>
			</div>
			<div class="span5">
			 	<p> <span class="contact-label"> <g:message code="contact.position.label" default="Position" />: </span> ${fieldValue(bean: contact, field: "position")}</p>
			 	<p> <span class="contact-label"> <g:message code="contact.sendAlerts.label" default="Send alerts?"/>: </span> <g:formatBoolean boolean="${contact.sendAlerts}"/></p>
			</div>
		</div>
		</div>	
</g:each>
