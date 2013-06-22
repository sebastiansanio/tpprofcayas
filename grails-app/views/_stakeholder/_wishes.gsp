<div>

		<table class="table table-condensed table-bordered">
		<thead>
			<tr>
				<th>${message(code: 'wish.opNumber.label', default: 'Op Number')}</th>
			
				<th>${message(code: 'wish.customerOpNumber.label', default: 'Customer Op Number')}</th>
			
				<th>${message(code: 'wish.customer.label', default: 'Customer')}</th>

				<th>${message(code: 'wish.supplier.label', default: 'Supplier')}</th>
			
				<th>${message(code: 'wish.shipper.label', default: 'Shipper')}</th>
			
				<th>${message(code: 'wish.supplierOrder.label', default: 'Supplier Order')}</th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${wishes}" status="i" var="wishInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link controller="wish" action="show" id="${wishInstance.id}">${fieldValue(bean: wishInstance, field: "opNumber")}</g:link></td>
			
				<td>${fieldValue(bean: wishInstance, field: "customerOpNumber")}</td>
			
				<td><g:link controller="customer" action="show" id="${wishInstance.customer.id}">${fieldValue(bean: wishInstance, field: "customer")}</g:link></td>
			
				<td><g:link controller="supplier" action="show" id="${wishInstance.supplier.id}">${fieldValue(bean: wishInstance, field: "supplier")}</g:link></td>
			
				<td><g:link controller="shipper" action="show" id="${wishInstance.shipper?.id}">${fieldValue(bean: wishInstance, field: "shipper")}</g:link></td>
			
				<td>${fieldValue(bean: wishInstance, field: "supplierOrder")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>


</div>