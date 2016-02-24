<table class="table">
    <tbody>

        <g:each var="list" in="${priceLists.sort{it.name}}">
            <tr class="prop">
                <td valign="top" class="value">${list.name}</td>
            </tr>
        </g:each>
    </tbody>
</table>