<table class="table">
    <tbody>

        <g:each var="list" in="${priceLists.sort{it.name}}">
            <tr class="prop">
                <td valign="top" class="value"> <g:link controller="priceList" action="show" id="${list.id}">${list.name}</g:link></td>
            </tr>
        </g:each>
    </tbody>
</table>