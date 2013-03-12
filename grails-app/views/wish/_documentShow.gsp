<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>

<table class="table table-hover">
	<thead>
	    <tr>
            <th></th>
            <th valign="top" class="name">${message(code: 'document.trackingNumber.label', default: 'Tracking number')}</th>
            <th valign="top" class="name">${message(code: 'document.received.label', default: 'Date received')}</th>
            <th valign="top" class="name">${message(code: 'default.downloadFile.label', default: 'Download file')}</th>
        </tr>
    </thead>
	<tbody>
		<g:each var="document" in="${documents}">
			<tr>
                <td valign="top" class="value">${fieldValue(bean: document, field: "documentType.name")}</td>

                <td valign="top" class="value">${fieldValue(bean: document, field: "trackingNumber")}</td>

                <td valign="top" class="value"><g:formatDate date="${document?.received}"/> </td>
                
                <td valign="top" class="value"></td>
			</tr>
		</g:each>
    </tbody>
</table>