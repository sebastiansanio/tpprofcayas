<script type="text/javascript">
	var cantCustomerContact = ${stakeholderInstance?.contacts?.size()} + 0;
	var nameLabel = "${message(code: 'contact.name.label', default: 'Name')}";
	var emailLabel = "${message(code: 'contact.email.label', default: 'Email')}";
	var positionLabel = "${message(code: 'contact.position.label', default: 'Puesto')}";
</script>
<script type="text/javascript" src="${resource(dir:'js', file:'contactFunc.js')}"> </script>	

<h5><g:message code="contact.information.label" default="Contact information"/></h5>
	
<p id="contact"></p>
<a role="button" class="btn btn-small btn-primary" id="btnAdd-contact"> ${message(code: 'customer.addContact.label', default: 'Add contact')}</a>
