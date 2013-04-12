<tr class="prop">
	<td colspan="2" valign="top" class="name">
		<g:message code="contact.label" default="Contact" />
		<ul>
			<g:each in="${stakeholderInstance.contacts}" var="contact">
				<li>
				 	<p> <g:message code="contact.name.label" default="Name" />: ${fieldValue(bean: contact, field: "name")}</p>
				 	<p> <g:message code="contact.email.label" default="Name" />: ${fieldValue(bean: contact, field: "email")}</p>
				 	<p> <g:message code="contact.position.label" default="Name" />: ${fieldValue(bean: contact, field: "position")}</p>
				 </li>						
			</g:each>
		</ul>
	</td>
</tr>