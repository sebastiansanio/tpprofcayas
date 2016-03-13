<table class="table">
    <thead>
        <th><g:message code="supplier.label"/></th>
        <th><g:message code="priceList.label"/></th>
    </thead>
    <tbody>

        <g:each var="list" in="${priceLists.sort{it.supplier.toString()}}">
            <tr class="prop">
                <td valign="top" class="value">${list.supplier}</td>
                <td valign="top" class="value"> <g:link controller="priceList" action="show" id="${list.id}">${list.name}</g:link></td>
            </tr>
        </g:each>
    </tbody>
</table>