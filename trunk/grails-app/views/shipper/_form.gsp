<%@ page import="stakeholder.Shipper" %>
<h5><g:message code="stakeholder.shipperInformation.label" default="Shipper information"/></h5>

<div class="row-fluid">
	<div class="span6">
		

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'name', 'error')} required">
			<label for="name" class="control-label"><g:message code="shipper.name.label" default="Name" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:textField name="name" required="" value="${shipperInstance?.name}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'name', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'telephone', 'error')} ">
			<label for="telephone" class="control-label"><g:message code="shipper.telephone.label" default="Telephone" /></label>
			<div class="controls">
				<g:textField name="telephone" value="${shipperInstance?.telephone}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'telephone', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'email', 'error')} ">
			<label for="email" class="control-label"><g:message code="shipper.email.label" default="Email" /></label>
			<div class="controls">
				<g:field type="email" name="email" value="${shipperInstance?.email}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'email', 'error')}</span>
			</div>
		</div>	
		
		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'notes', 'error')} ">
			<label for="notes" class="control-label"><g:message code="stakeholder.notes.label" default="Notes" /></label>
			<div class="controls">
				<g:textArea rows="5" name="notes" value="${shipperInstance?.notes}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'notes', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'defaultReport', 'error')} required">
			<label for="defaultReport" class="control-label"><g:message code="shipper.defaultReport.label" default="Default Report" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" value="${shipperInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'defaultReport', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'defaultLocale', 'error')} required">
			<label for="defaultLocale" class="control-label"><g:message code="shipper.defaultLocale.label" default="Default Locale" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" value="${shipperInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'defaultLocale', 'error')}</span>
			</div>
		</div>
		
	</div>
	
	<div class="span6">



		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'country', 'error')} required">
			<label for="country" class="control-label"><g:message code="shipper.country.label" default="Country" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${shipperInstance?.country?.id}" class="many-to-one"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'country', 'error')}</span>
			</div>
		</div>
		
		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'province', 'error')}">
			<label for="province" class="control-label"><g:message code="customer.province.label" default="Province" /></label>
			<div class="controls">
				<g:textField name="province" value="${shipperInstance?.province}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'province', 'error')}</span>
			</div>
		</div>
			
		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'locality', 'error')}">
			<label for="locality" class="control-label"><g:message code="customer.locality.label" default="Locality" /></label>
			<div class="controls">
				<g:textField name="locality" value="${shipperInstance?.locality}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'locality', 'error')}</span>
			</div>
		</div>
		
		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'accountName', 'error')} ">
			<label for="accountName" class="control-label"><g:message code="stakeholder.accountName.label" default="Account name" /></label>
			<div class="controls">
				<g:textField name="accountName" value="${shipperInstance?.accountName}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'accountName', 'error')}</span>
			</div>
		</div>	
		
		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'accountNumber', 'error')} ">
			<label for="accountNumber" class="control-label"><g:message code="stakeholder.accountNumber.label" default="Account number" /></label>
			<div class="controls">
				<g:textField name="accountNumber" value="${shipperInstance?.accountNumber}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'accountNumber', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'bankName', 'error')} ">
			<label for="bankName" class="control-label"><g:message code="stakeholder.bankName.label" default="Bank name" /></label>
			<div class="controls">
				<g:textField name="bankName" value="${shipperInstance?.bankName}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'bankName', 'error')}</span>
			</div>
		</div>	
		
		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'bankAddress', 'error')} ">
			<label for="bankAddress" class="control-label"><g:message code="stakeholder.bankAddress.label" default="Bank address" /></label>
			<div class="controls">
				<g:textField name="bankAddress" value="${shipperInstance?.bankAddress}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'bankAddress', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'swiftCode', 'error')} ">
			<label for="swiftCode" class="control-label"><g:message code="stakeholder.swiftCode.label" default="Swift code" /></label>
			<div class="controls">
				<g:textField name="swiftCode" value="${shipperInstance?.swiftCode}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'swiftCode', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'owner', 'error')} ">
			<label for="owner" class="control-label"><g:message code="stakeholder.owner.label" default="Owner" /></label>
			<div class="controls">
				<g:textField name="owner" value="${shipperInstance?.owner}"/>
				<span class="help-inline">${hasErrors(bean: shipperInstance, field: 'owner', 'error')}</span>
			</div>
		</div>	

		
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: shipperInstance, field: 'wishes', 'error')} ">
	<label for="wishes" class="control-label"><g:message code="shipper.wishes.label" default="Wishes" /></label>
		<div class="controls">
			
			<ul class="one-to-many">

				<li class="add">
					<g:link controller="wish" action="create" params="['shipper.id': shipperInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
				</li>
			</ul>


	</div>
</div>

<g:render template="/_stakeholder/form" model="['stakeholderInstance':shipperInstance]"/>
