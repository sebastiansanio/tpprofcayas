<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'contactStyle.css')}" />

<tr class="prop">
	<td colspan="2" valign="top" class="name">
		<g:message code="contact.label" default="Contact" />
		<ul>
			<g:each in="${stakeholderInstance.contacts}" var="contact">
				<li>
					<div class="contact-card">
					 	<p> <span class="contact-label"> <g:message code="contact.name.label" default="Name" />: </span> <g:link controller="contact" action="show"  id="${contact.id}"> ${fieldValue(bean: contact, field: "name")} </g:link></p>
					 	<p> <span class="contact-label"> <g:message code="contact.email.label" default="Email" />: </span> ${fieldValue(bean: contact, field: "email")}</p>
					 	<p> <span class="contact-label"> <g:message code="contact.position.label" default="Position" />: </span> ${fieldValue(bean: contact, field: "position")}</p>
				 	</div>
				 </li>						
			</g:each>
		</ul>
	</td>
</tr>