<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
</head>

<body>
	
<section id="list-priceList" class="first">
<h5>Variables expiradas</h5>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>Fecha</th>
			<th>Variable</th>

		</tr>
	</thead>
	<tbody>
	<g:each in="${priceVariableAlerts}" status="i" var="priceVariableAlert">
		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			<td>priceVariableAlert.expireDate</td>
			<td>priceVariableAlert.toString()</td>		
		</tr>
	</g:each>
	</tbody>
</table>


</section>

</body>

</html>
