<%@ page import="stakeholder.Supplier" %>

<h5><g:message code="stakeholder.supplierInformation.label" default="Supplier information"/></h5>

<div class="row-fluid">
	<div class="span6">		
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'name', 'error')} required">
			<label for="name" class="control-label"><g:message code="supplier.name.label" default="Name" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:textField name="name" required="" value="${supplierInstance?.name}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'name', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'telephone', 'error')} ">
			<label for="telephone" class="control-label"><g:message code="supplier.telephone.label" default="Telephone" /></label>
			<div class="controls">
				<g:textField name="telephone" value="${supplierInstance?.telephone}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'telephone', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'email', 'error')} ">
			<label for="email" class="control-label"><g:message code="supplier.email.label" default="Email" /></label>
			<div class="controls">
				<g:field type="email" name="email" value="${supplierInstance?.email}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'email', 'error')}</span>
			</div>
		</div>
		
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'notes', 'error')} ">
			<label for="notes" class="control-label"><g:message code="stakeholder.notes.label" default="Notes" /></label>
			<div class="controls">
				<g:textArea rows="5" name="notes" value="${supplierInstance?.notes}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'notes', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'address', 'error')} ">
			<label for="address" class="control-label"><g:message code="supplier.address.label" default="Address" /></label>
			<div class="controls">
				<g:textField name="address" value="${supplierInstance?.address}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'address', 'error')}</span>
			</div>
		</div>
				
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'taxRegistryNumber', 'error')} ">
			<label for="taxRegistryNumber" class="control-label"><g:message code="supplier.taxRegistryNumber.label" default="Tax Registry Number" /></label>
			<div class="controls">
				<g:textField name="taxRegistryNumber" value="${supplierInstance?.taxRegistryNumber}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'taxRegistryNumber', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'defaultReport', 'error')} required">
			<label for="defaultReport" class="control-label"><g:message code="stakeholder.defaultReport.label" default="Default Report" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultReport" name="defaultReport.id" from="${report.Report.list()}" optionKey="id" value="${supplierInstance?.defaultReport?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'defaultReport', 'error')}</span>
			</div>
		</div>

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'defaultLocale', 'error')} required">
			<label for="defaultLocale" class="control-label"><g:message code="stakeholder.defaultLocale.label" default="Default Locale" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="defaultLocale" name="defaultLocale.id" from="${modal.AvailableLocale.list()}" optionKey="id" value="${supplierInstance?.defaultLocale?.id}" class="many-to-one" noSelection="['null': '']"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'defaultLocale', 'error')}</span>
			</div>
		</div>


		
	</div>
	<div class="span6">
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'country', 'error')} required">
			<label for="country" class="control-label"><g:message code="supplier.country.label" default="Country" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:select id="country" name="country.id" from="${modal.Country.list()}" optionKey="id" required="" value="${supplierInstance?.country?.id}" class="many-to-one"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'country', 'error')}</span>
			</div>
		</div>


		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'province', 'error')}">
			<label for="province" class="control-label"><g:message code="customer.province.label" default="Province" /></label>
			<div class="controls">
				<g:textField name="province" value="${supplierInstance?.province}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'province', 'error')}</span>
			</div>
		</div>
			
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'locality', 'error')}">
			<label for="locality" class="control-label"><g:message code="customer.locality.label" default="Locality" /></label>
			<div class="controls">
				<g:textField name="locality" value="${supplierInstance?.locality}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'locality', 'error')}</span>
			</div>
		</div>
		
				<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'accountName', 'error')} ">
			<label for="accountName" class="control-label"><g:message code="stakeholder.accountName.label" default="Account name" /></label>
			<div class="controls">
				<g:textField name="accountName" value="${supplierInstance?.accountName}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'accountName', 'error')}</span>
			</div>
		</div>	
		
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'accountNumber', 'error')} ">
			<label for="accountNumber" class="control-label"><g:message code="stakeholder.accountNumber.label" default="Account number" /></label>
			<div class="controls">
				<g:textField name="accountNumber" value="${supplierInstance?.accountNumber}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'accountNumber', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'bankName', 'error')} ">
			<label for="bankName" class="control-label"><g:message code="stakeholder.bankName.label" default="Bank name" /></label>
			<div class="controls">
				<g:textField name="bankName" value="${supplierInstance?.bankName}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'bankName', 'error')}</span>
			</div>
		</div>	
		
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'bankAddress', 'error')} ">
			<label for="bankAddress" class="control-label"><g:message code="stakeholder.bankAddress.label" default="Bank address" /></label>
			<div class="controls">
				<g:textField name="bankAddress" value="${supplierInstance?.bankAddress}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'bankAddress', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'swiftCode', 'error')} ">
			<label for="swiftCode" class="control-label"><g:message code="stakeholder.swiftCode.label" default="Swift code" /></label>
			<div class="controls">
				<g:textField name="swiftCode" value="${supplierInstance?.swiftCode}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'swiftCode', 'error')}</span>
			</div>
		</div>	

		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'owner', 'error')} ">
			<label for="owner" class="control-label"><g:message code="stakeholder.owner.label" default="Owner" /></label>
			<div class="controls">
				<g:textField name="owner" value="${supplierInstance?.owner}"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'owner', 'error')}</span>
			</div>
		</div>	
		
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'wishes', 'error')} ">
	<label for="wishes" class="control-label"><g:message code="supplier.wishes.label" default="Wishes" /></label>
		<div class="controls">
			
			<ul class="one-to-many">
				<li class="add">
					<g:link controller="wish" action="create" params="['supplier.id': supplierInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wish.label', default: 'Wish')])}</g:link>
				</li>
				</ul>
	</div>
</div>

<g:render template="/_stakeholder/form" model="['stakeholderInstance':supplierInstance]"/>

<h5><g:message code="supplier.aluminum.extras.label" default="Aluminum Extras" /></h5>

<div class="row-fluid">
	<div class="span12">
		<div class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'aluminumSupplier', 'error')}">
			<label for="aluminumSupplier" class="control-label"><g:message code="supplier.aluminumSupplier.label" default="Aluminum Supplier" /> </label>
			<div class="controls">
				<g:checkBox name="aluminumSupplier" value="${supplierInstance?.aluminumSupplier}" />
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'aluminumSupplier', 'error')}</span>
			</div>
		</div>	
		<div id="aluminumExtra" class="control-group fieldcontain ${hasErrors(bean: supplierInstance, field: 'extrasDefault', 'error')}">
			<label for="extrasDefault" class="control-label"><g:message code="supplier.extrasDefault.label" default="Aluminum Extras" /> </label>
			<div class="controls">
				<g:select id="extrasDefault" name="extrasDefault.id" from="${product.Extra.list()}" optionKey="id" value="${supplierInstance?.extrasDefault?.id}" class="many-to-many" multiple="true"/>
				<span class="help-inline">${hasErrors(bean: supplierInstance, field: 'extrasDefault', 'error')}</span>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready( function() {
		function updateView() {
			if ( $("#aluminumSupplier").is(":checked") ) {
				$("#aluminumExtra").show();
				$("#extrasDefault").attr('name', 'extrasDefault.id');
			}
			else {
				$("#aluminumExtra").hide();
				$("#extrasDefault").removeAttr('name');
			}
			
		}

		updateView();

		$("#aluminumSupplier").on("change", updateView);
	});
</script>