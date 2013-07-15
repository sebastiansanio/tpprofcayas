<%@ page import="wish.Wish" %>

<table class="table table-hover">
	<thead>
	    <tr>
            <th valign="top" class="name">${message(code: 'draft.description.label', default: 'Description')}</th>
        </tr>
    </thead>
	<tbody>
		<g:each var="draft" in="${drafts}">
			<tr>
                <td valign="top" class="value">${fieldValue(bean: draft, field: "description")}</td>

                
			</tr>
		</g:each>
    </tbody>
</table>