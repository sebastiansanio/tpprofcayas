<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>

<h5><g:message code="wish.firstStageRequiredDocuments.label" default="First Stage Required Documents"/></h5>
	<div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'firstStageRequiredDocuments', 'error')} ">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>${message(code: 'wish.requiredDocumentation.label', default: 'Required documentation')}</th>
                  	<th>${message(code: 'document.trackingNumber.label', default: 'Tracking number')}</th>
                  	<th>${message(code: 'document.received.label', default: 'Date received')}</th>
                  	<th> </th>
                </tr>
            </thead>
			<tbody>
				<g:each var="document" in="${DocumentType?.list().findAll{it.isPhase1()}}" status="i">
					<tr>
	                  	<td>
	                  	    <label class="checkbox">
	                  	        <input type="checkbox" id="check1-${i}" onclick="clickDocPhase1('${i}')" value="${document?.id}">${document?.name}
	                  	    </label>
	                  	</td>

	                  	<td> <g:textField name="documentTrackingNumber" id="txt1-${i}"/> </td>

	                  	<td> <bs:datePicker name="documentDay" precision="day"default="none" noSelection="['': '']" id="date1-${i}"/> </td>

	                  	<td>
	                  		<p><input type="file" id="btnAdd1-${i}" name="document"></p>
	                  		<p><a role="button" class="btn btn-small btn-primary" id="btnDel1-${i}"> ${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</a></p>
	                  	 </td>
					</tr>
				</g:each>
             </tbody>
		</table>
	</div>

<hr>
 <h5><g:message code="wish.secondStageRequiredDocuments.label" default="Second Stage Required Documents"/></h5>
    <div class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'secondStageRequiredDocuments', 'error')} ">
 		<table class="table table-hover">
 			<thead>
 				<tr>
 					<th>${message(code: 'wish.requiredDocumentation.label', default: 'Required documentation')}</th>
                   	<th>${message(code: 'document.trackingNumber.label', default: 'Tracking number')}</th>
                   	<th>${message(code: 'document.received.label', default: 'Date received')}</th>
                   	<th> </th>
                 </tr>
             </thead>
 			<tbody>
				<g:each var="document" in="${DocumentType?.list().findAll{it.isPhase2()}}" status="i">
					<tr>
	                  	<td>
	                  	    <label class="checkbox">
	                  	        <input type="checkbox" id="check2-${i}" onclick="clickDocPhase2('${i}')" value="${document?.id}">${document?.name}
	                  	    </label>
	                  	</td>

	                  	<td> <g:textField name="documentTrackingNumber" id="txt2-${i}"/> </td>

	                  	<td> <bs:datePicker name="documentDay" precision="day"default="none" noSelection="['': '']" id="date2-${i}"/> </td>

	                  	<td>
	                  		<p><input type="file" id="btnAdd2-${i}" name="document"></p>
	                  		<p><a role="button" class="btn btn-small btn-primary" id="btnDel2-${i}"> ${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</a></p>
	                  	 </td>
					</tr>
				</g:each>

              </tbody>
 		</table>
</div>

<script type="text/javascript">

    $(document).ready(function() {

        var init = function(countElement, nroDoc)
        {
            var text, date, btnAdd, btnDel;

            for(var i = 0; i < countElement; i++)
            {
                text   = "#txt"    + nroDoc + "-" + i;
                date   = "#date"   + nroDoc + "-" + i;
                btnAdd = "#btnAdd" + nroDoc + "-" + i;
                btnDel = "#btnDel" + nroDoc + "-" + i;

                $(text).prop("disabled", true);
                $(date).prop("disabled", true);
                $(btnAdd).attr("disabled", "disabled");
                $(btnDel).attr("disabled", "disabled");

                if ('${params.action}' == "create")
                    $(btnDel).hide();
            }

        };

        init(${DocumentType?.list().findAll{it.isPhase1()}?.size()}, 1);
        init(${DocumentType?.list().findAll{it.isPhase2()}?.size()}, 2);
    });

    function clickDocPhase1(nroId)
    {
        enableDisable(nroId, 1);

        var elementCount = ${DocumentType?.list().findAll{it.isPhase1()}?.size()};
        setName(elementCount, 1,"firstStageRequiredDocuments");
    }

    function clickDocPhase2(nroId)
    {
        enableDisable(nroId, 2);

        var elementCount = ${DocumentType?.list().findAll{it.isPhase2()}?.size()};
        setName(elementCount, 2,"secondStageRequiredDocuments");
    }

    function enableDisable(nroId, nroDoc)
    {
        /* habilita los demás inputs si el check está marcado  */

        var	check  = "#check" + nroDoc + "-" + nroId;
        var	text   = "#txt"   + nroDoc + "-" + nroId;
        var	date   = "#date"  + nroDoc + "-" + nroId;
        var	btnAdd = "#btnAdd"+ nroDoc + "-" + nroId;
        var	btnDel = "#btnDel"+ nroDoc + "-" + nroId;

        if ($(check).prop("checked") == true)
        {
            $(text).prop("disabled", false);
            $(date).prop("disabled", false);
            $(btnAdd).removeAttr("disabled");
            $(btnDel).removeAttr("disabled");
        }
        else
        {
            $(text).prop("disabled", true);
            $(date).prop("disabled", true);
            $(btnAdd).attr("disabled", "disabled");
            $(btnDel).attr("disabled", "disabled");
        }
    }

    function setName(elementCount, nroDoc, list)
    {
        /* cambia los names para pasarle al controlador solo los que están marcados */
        for (var i = 0, id = 0; i < elementCount; i++)
        {
            var check  = "#check"  + nroDoc + "-" + i;
            var	text   = "#txt"    + nroDoc + "-" + i;
            var	date   = "#date"   + nroDoc + "-" + i;
            var	btnAdd = "#btnAdd" + nroDoc + "-" + i;
            var	btnDel = "#btnDel" + nroDoc + "-" + i;

             if ($(check).prop("checked") == true)
             {
                var checkName  = list + "[" + id + "].documentType.id";
                var	textName   = list + "[" + id + "].trackingNumber";
                var	dateName   = list + "[" + id + "].received";
                var	btnAddName = list + "[" + id + "].file";

                $(check).attr("name", checkName);
                $(text).attr("name", textName);
                $(date).attr("name", dateName);
                $(btnAdd).attr("name", btnAddName);

                id++;
             }
             else
             {
                $(check).removeAttr("name");
                $(text).removeAttr("name");
                $(date).removeAttr("name");
                $(btnAdd).removeAttr("name");
             }
        }
    }
</script>