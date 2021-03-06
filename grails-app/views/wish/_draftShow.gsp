<%@ page import="wish.Wish" %>

<table class="table table-hover">
	<thead>
	    <tr>
            <th valign="top" class="name">${message(code: 'draft.description.label', default: 'Description')}</th>
            <th valign="top" class="name">${message(code: 'default.downloadFile.label', default: 'Download file')}</th>
        </tr>
    </thead>
	<tbody>
		<g:each var="draft" in="${drafts}">
			<tr>
                <td valign="top" class="value">${fieldValue(bean: draft, field: "description")}</td>

                <td valign="top" class="value"> <a href="${createLink(action: 'downloadDraft',id: draft?.id)}" target="_blank"><i class="icon-download-alt"></i></a> </td>
			</tr>
		</g:each>
    </tbody>
</table>