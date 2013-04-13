<script type="text/javascript">
	var cantContact = ${stakeholderInstance?.contacts?.size()} + 0;
	var nameLabel = "${message(code: 'contact.name.label', default: 'Name')}";
	var emailLabel = "${message(code: 'contact.email.label', default: 'Email')}";
	var positionLabel = "${message(code: 'contact.position.label', default: 'Puesto')}";
</script>
<script type="text/javascript" src="${resource(dir:'js', file:'contactFunc.js')}"> </script>	

<h5><g:message code="contact.information.label" default="Contact information"/></h5>

<g:each in="${stakeholderInstance?.contacts}" var="contactInstance" status="i">

	<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} required">
		<label for="contacts[${i}].name" class="control-label"><g:message code="contact.name.label" default="Name" /><span class="required-indicator">*</span></label>
		<div class="controls">
			<g:textField name="contacts[${i}].name" required="" value="${contactInstance?.name}" id="contacts[${i}].name"/>
			<span class="help-inline">${hasErrors(bean: contactInstance, field: 'name', 'error')}</span>
		</div>
	</div>

	<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} ">
		<label for="contacts[${i}].email" class="control-label"><g:message code="contact.email.label" default="Email" /></label>
		<div class="controls">
			<g:field type="email" name="contacts[${i}].email" value="${contactInstance?.email}" id="contacts[${i}].email"/>
			<span class="help-inline">${hasErrors(bean: contactInstance, field: 'email', 'error')}</span>
		</div>
	</div>

	<div class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'position', 'error')} ">
		<label id="" for="contacts[${i}].position" class="control-label"><g:message code="contact.position.label" default="Position" /></label>
		<div class="controls">
			<g:textField name="contacts[${i}].position" value="${contactInstance?.position}" id="contacts[${i}].position"/>
			<span class="help-inline">${hasErrors(bean: contactInstance, field: 'position', 'error')}</span>
		</div>
	</div>
	
	<g:if test="${!contactInstance.id}">
		<a role="button" class="btn btn-small btn-primary btnDel-contact-temp" id="btnDel-contact-${i}"><i class="icon-trash"></i></a><
	</g:if>
    <g:else>							
		<a href="#modalDeleteContact" role="button" class="btn btn-small btn-primary btnDel-contact" id="btnDel-draft-${i}"> <i class="icon-trash"></i> </a>			
	</g:else>
                  		
	<hr>
</g:each>
	
<p id="contact"></p>
<a role="button" class="btn btn-small btn-primary" id="btnAdd-contact"> ${message(code: 'customer.addContact.label', default: 'Add contact')}</a>
