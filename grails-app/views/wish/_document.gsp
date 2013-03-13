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
	                  	        <input type="checkbox" class="checkDoc-1" id="check1-${i}" onclick="clickDocPhase1('${i}')" value="${document?.id}">${document?.name}
	                  	    </label>
	                  	</td>

	                  	<td> <g:textField name="documentTrackingNumber" id="txt1-${i}"/> </td>

	                  	<td> <bs:datePicker name="documentDay" precision="day"default="none" noSelection="['': '']" id="date1-${i}"/> </td>

	                  	<td>
	                  		<p><input type="file" id="btnAdd1-${i}" name="document"></p>
	                  		<p><a role="button" class="btn btn-small btn-primary btnRep" id="btnRep1-${i}"> ${message(code: 'document.replacefile.label', default: 'Replace file')}</a></p>
	                  		<p><a href="#modalDeleteDocument" role="button" class="btn btn-small btn-primary btnDel1" id="btnDel1-${i}"> ${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</a></p>
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
	                  	        <input type="checkbox" class="checkDoc-2" id="check2-${i}" onclick="clickDocPhase2('${i}')" value="${document?.id}">${document?.name}
	                  	    </label>
	                  	</td>

	                  	<td> <g:textField name="documentTrackingNumber" id="txt2-${i}"/> </td>

	                  	<td> <bs:datePicker name="documentDay" precision="day" default="none" noSelection="['': '']" id="date2-${i}"/> </td>

	                  	<td>
	                  		<p><input type="file" id="btnAdd2-${i}" name="document"></p>
	                  		<p><a role="button" class="btn btn-small btn-primary btnRep" id="btnRep2-${i}"> ${message(code: 'document.replacefile.label', default: 'Replace file')}</a></p>
	                  		<p><a href="#modalDeleteDocument" role="button" class="btn btn-small btn-primary btnDel2" id="btnDel2-${i}"> ${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</a></p>
	                  	 </td>
					</tr>
				</g:each>
            </tbody>
 		</table>
    </div>

<script type="text/javascript">

function checkName(nroDoc, nroId) {
	return "#check" + nroDoc + "-" + nroId;
};

function textName(nroDoc, nroId) {
	return "#txt" + nroDoc + "-" + nroId;
};

function dateName(nroDoc, nroId) {
	return "#date" + nroDoc + "-" + nroId;
};

function btnAddName(nroDoc, nroId) {
	return "#btnAdd" + nroDoc + "-" + nroId;
};

function btnDelName(nroDoc, nroId) {
	return "#btnDel" + nroDoc + "-" + nroId;
};

function btnRepName(nroDoc, nroId) {
	return "#btnRep" + nroDoc + "-" + nroId;
};

$(document).ready(function() {
    var init = function(countElement, nroDoc)
    {
        var text, date, btnAdd, btnDel;

        for(var i = 0; i < countElement; i++)
        {
            text   = textName(nroDoc, i);
            date   = dateName(nroDoc, i);
            btnAdd = btnAddName(nroDoc, i);
            btnDel = btnDelName(nroDoc, i);
			btnRep = btnRepName(nroDoc, i);
			
            $(text).prop("disabled", true);
            $(date).prop("disabled", true);
            $(btnAdd).attr("disabled", "disabled");
            $(btnDel).attr("disabled", "disabled");

           	$(btnDel).hide();
           	$(btnRep).hide();
        }

    };

    init("${DocumentType?.list().findAll{it.isPhase1()}?.size()}", 1);
    init("${DocumentType?.list().findAll{it.isPhase2()}?.size()}", 2);


    $(".btnDel1").click(function()
    {
        modalDelete(1, this.id.split("-")[1], "deleteDocumentFirstPhase");
    }); 

    $(".btnDel2").click(function()
    {
        modalDelete(2, this.id.split("-")[1], "deleteDocumentSecondPhase");
    });
});

$(".btnRep").click(function()
{	
	var nroId = this.id.split("-")[1];
	var aux = this.id.split("-")[0]; //primer parte del id
	var nroDoc = aux.slice(6,aux.length); //6 = btnRep
	
	var nameAdd = btnAddName(nroDoc, nroId);	
	$(nameAdd).show();
	
	var idButton = "#" + this.id;	
	$(idButton).hide();
});
	    
function clickDocPhase1(nroId)
{
    enableDisable(nroId, 1);

    var elementCount = "${DocumentType?.list().findAll{it.isPhase1()}?.size()}";
    setName(elementCount, 1,"firstStageRequiredDocuments");
};

function clickDocPhase2(nroId)
{
    enableDisable(nroId, 2);

    var elementCount = "${DocumentType?.list().findAll{it.isPhase2()}?.size()}";
    setName(elementCount, 2,"secondStageRequiredDocuments");
};

function enableDisable(nroId, nroDoc)
{
    /* habilita los demás inputs si el check está marcado  */
    var	check  = checkName(nroDoc, nroId);
    var	text   = textName(nroDoc, nroId);
    var	date   = dateName(nroDoc, nroId);
    var	btnAdd = btnAddName(nroDoc, nroId);
    var	btnDel = btnDelName(nroDoc, nroId);

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
};

function setName(elementCount, nroDoc, list)
{
    /* cambia los names para pasarle al controlador solo los que están marcados */
    for (var i = 0, id = 0; i < elementCount; i++)
    {
        var	check  = "#check"  + nroDoc + "-" + i;
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
};

function modalDelete(nroDoc, nroId, nameMethod)
{
    var nameCheck = checkName(nroDoc, nroId);

    var nameAtribute = $(nameCheck).attr("name");
    var nroIdDocInWish = nameAtribute.split("[")[1].split("]")[0];
    
	$("#nroCurrentDocumentDelete").attr("value", nroIdDocInWish);

	var nameAcction = $("#nroCurrentDocumentDelete").parent().attr("action");
	var regExp = nameMethod + "?";
	var nameNewAcction = nameAcction.replace(/deleteDocument*\?/, regExp);

    $("#nroCurrentDocumentDelete").parent().attr("action", nameNewAcction);
    
    $("#modalDeleteDocument").modal('show'); 	
};

function enableComponentCheck(numDoc, datos, clickFunc)
{
	var idTypeDoc = ".checkDoc-" + numDoc + "[value = " + datos[0] + "]";
    $(idTypeDoc).prop("checked", true); //marco el check si el doc esta en el pedido

    var nroId = $(idTypeDoc).attr("id").split("-")[1];

	clickFunc(nroId); //habilito los demás componentes
	
    var	text   = "#txt"   + numDoc + "-" + nroId;
    var	date   = "#date"  + numDoc + "-" + nroId;
    var	btnAdd = "#btnAdd"+ numDoc + "-" + nroId;
    var	btnDel = "#btnDel"+ numDoc + "-" + nroId;
    var	btnRep = "#btnRep"+ numDoc + "-" + nroId;
    

    $(idTypeDoc).prop("disabled", true);
    $(text).attr("value", datos[1]);
    $(date).attr("value", datos[2]);

    $(btnDel).show();	

    if (datos[3] == true) // no hay archivo
    {
        $(btnAdd).show(); 
    }
    else // si hay archivo
    {
        $(btnAdd).hide();
        $(btnRep).show();
    }	
};
</script>

<g:each var="doc1" in="${wishInstance?.firstStageRequiredDocuments}">
    <script type="text/javascript">
        $(document).ready(function() {

            var datos = ["${doc1?.documentType?.id}", "${doc1?.trackingNumber}", '${doc1?.received?.format("dd/MM/yyyy")}', "${doc1?.file?.length}" == "0"];
            
            enableComponentCheck(1, datos, clickDocPhase1);            
         });
    </script>
</g:each>

<g:each var="doc2" in="${wishInstance?.secondStageRequiredDocuments}">
    <script type="text/javascript">
        $(document).ready(function() {

        	var datos = ["${doc2?.documentType?.id}", "${doc2?.trackingNumber}", '${doc2?.received?.format("dd/MM/yyyy")}', "${doc2?.file?.length}" == "0"];
        	
            enableComponentCheck(2, datos, clickDocPhase2);			
         });
    </script>
</g:each>