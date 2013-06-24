<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>

<table class="table table-hover">
	<thead>
	    <tr>
            <th valign="top" class="name">${message(code: 'documentType.label', default: 'Document type')}</th>
            <th valign="top" class="name">${message(code: 'document.trackingNumber.label', default: 'Tracking number')}</th>
            <th valign="top" class="name">${message(code: 'document.received.label', default: 'Date received')}</th>
            <th valign="top" class="name">${message(code: 'document.deliveredToCustomsBrokerDate.label', default: 'Delivered to customs broker')}</th>
            <th valign="top" class="name">${message(code: 'document.deliveredToLawyerDate.label', default: 'Delivered to lawyer')}</th>
            <th valign="top" class="name">${message(code: 'document.deliveredToCustomerDate.label', default: 'Delivered to customer')}</th>
            <th valign="top" class="name">${message(code: 'default.downloadFile.label', default: 'Download file')}</th>
        </tr>
    </thead>
	<tbody>
		<g:each var="document" in="${documents}">
			<tr>
                <td valign="top" class="value">${fieldValue(bean: document, field: "documentType.name")}</td>

                <td valign="top" class="value">${fieldValue(bean: document, field: "trackingNumber")}</td>

                <td valign="top" class="value"><g:formatDate date="${document?.arrivalDate}"/> </td>
                <td valign="top" class="value"><g:formatDate date="${document?.deliveredToCustomsBrokerDate}"/> </td>
                <td valign="top" class="value"><g:formatDate date="${document?.deliveredToLawyerDate}"/> </td>
                <td valign="top" class="value"><g:formatDate date="${document?.deliveredToCustomerDate}"/> </td>
                
                <td valign="top" class="value">
	                <g:if test="${document?.file.length == 0}">
	                	<em>${message(code: 'default.nofile.label', default: 'No File')}</em>
	                </g:if>
	                <g:else> 
	                	<a href="${createLink(action: 'downloadDocument',id: document?.id)}" target="_blank"><i class="icon-download-alt"></i></a>
               		</g:else>
               	</td>
			</tr>
		</g:each>
    </tbody>
</table>