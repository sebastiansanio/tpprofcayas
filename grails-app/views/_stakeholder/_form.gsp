<script type="text/javascript">
	var cantContact = ${stakeholderInstance?.contacts?.size()} + 0;
	var nameLabel = "${message(code: 'contact.name.label', default: 'Name')}";
	var emailLabel = "${message(code: 'contact.email.label', default: 'Email')}";
	var positionLabel = "${message(code: 'contact.position.label', default: 'Puesto')}";
	var seleccLabel = "${message(code: 'default.boolean.true', default: 'Yes')}";
	var noSeleccLabel = "${message(code: 'default.boolean.false', default:'No')}";
</script>
<script type="text/javascript" src="${resource(dir:'js', file:'contactFunc.js')}"> </script>	

<h5><g:message code="contact.information.label" default="Contact information"/></h5>

	<div class="control-group fieldcontain ${hasErrors(bean: stakeholderInstance, field: 'contacts', 'error')} ">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>${message(code: 'contact.name.label', default: 'Name')} <span class="required-indicator">*</span> </th>
                  	<th>${message(code: 'contact.email.label', default: 'Email')}</th>
                  	<th>${message(code: 'contact.position.label', default: 'Position')}</th>
                  	<th>${message(code: 'contact.sendAlerts.label', default: 'Send alerts?')}</th>
                  	<th> </th>
                </tr>
            </thead>
			<tbody id="contact">
				<g:each in="${stakeholderInstance?.contacts}" var="contactInstance" status="i">
					<tr>
	                  	<td>
							<g:textField name="contacts[${i}].name" required="" value="${contactInstance?.name}" id="contacts-name-${i}" class="span3"/>
							<span class="help-inline">${hasErrors(bean: contactInstance, field: 'name', 'error')}</span>
						</td>
				
						<td> 
							<g:field type="email" name="contacts[${i}].email" value="${contactInstance?.email}" id="contacts-email-${i}" class="span3"/>
							<span class="help-inline">${hasErrors(bean: contactInstance, field: 'email', 'error')}</span>
						</td>
	
						<td>
							<g:textField name="contacts[${i}].position" value="${contactInstance?.position}" id="contacts-position-${i}" class="span3"/>
							<span class="help-inline">${hasErrors(bean: contactInstance, field: 'position', 'error')}</span>
						</td>

						<td>
							<g:if test="${contactInstance?.sendAlerts == true}">
								<input name="contacts[${i}].sendAlerts" type="checkbox" id="contacts-alerts-${i}" class="contact-check" value="${contactInstance?.sendAlerts}" checked="checked"> 
							</g:if>
							<g:else>
								<input name="contacts[${i}].sendAlerts" type="checkbox" id="contacts-alerts-${i}" class="contact-check" value="${contactInstance?.sendAlerts}">
							</g:else>
					
							<span class="help-inline">${hasErrors(bean: contactInstance, field: 'sendAlerts', 'error')}</span>
						</td>
												
						<td>	
							
							<g:if test="${!contactInstance.id}">
								<a role="button" class="btn btn-small btn-primary btnDel-contact-temp" id="btnDel-contact-${i}"><i class="icon-trash"></i></a>
							</g:if>
						    <g:else>							
								<a href="#modalDeleteContact" role="button" class="btn btn-small btn-primary btnDel-contact" id="btnDel-draft-${i}"> <i class="icon-trash"></i> </a>			
							</g:else>
				        </td>
				    </tr>
				</g:each>
            </tbody>
		</table>
	</div>
	
<a role="button" class="btn btn-small btn-primary" id="btnAdd-contact"> ${message(code: 'customer.addContact.label', default: 'Add contact')}</a>
