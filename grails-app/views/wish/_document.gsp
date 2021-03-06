<%@ page import="wish.Wish" %>
<%@ page import="modal.DocumentType" %>
<%@ page import="courier.DocumentsCourierRecord" %>

<h5><g:message code="wish.firstStageRequiredDocuments.label" default="First Stage Required Documents"/></h5>
	<div id="docPhases1" class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'firstStageRequiredDocuments', 'error')} ">
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th>${message(code: 'wish.requiredDocumentation.label', default: 'Required documentation')}</th>
                  	<th>${message(code: 'document.courierRecord.label', default: 'Courier Record')}</th>
                  	<th>${message(code: 'document.received.label', default: 'Date received')}</th>
                  	<th>${message(code: 'document.deliveredToCustomsBrokerDate.label', default: 'Delivered to Customs Broker')}</th>
                  	<th>${message(code: 'document.deliveredToLawyerDate.label', default: 'Delivered to Lawyer')}</th>
                  	<th>${message(code: 'document.deliveredToCustomerDate.label', default: 'Delivered to Customer')}</th>

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

	                  	<td> <g:select class="input-medium" from="${DocumentsCourierRecord.list()}" optionKey="id" noSelection="['null': '']" name="courier" id="courier1-${i}"/> </td>

	                  	<td> <bs:datePicker name="documentDay" precision="day" default="none" noSelection="['': '']" id="date1-${i}"/> </td>
	                  	<td> <bs:datePicker name="deliveredToCustomsBrokerDate" precision="day" default="none" noSelection="['': '']" id="deliveredToCustomsBrokerDate1-${i}"/> </td>
	                  	<td> <bs:datePicker name="deliveredToLawyerDate" precision="day" default="none" noSelection="['': '']" id="deliveredToLawyerDate1-${i}"/> </td>
	                  	<td> <bs:datePicker name="deliveredToCustomerDate" precision="day" default="none" noSelection="['': '']" id="deliveredToCustomerDate1-${i}"/> </td>

	                  	<td>
	                  		<p><input type="file" id="btnAdd1-${i}" name="document"></p>
	                  		<p><a href="#modalReplaceDocument" role="button" class="btn btn-small btn-primary btnRep" id="btnRep1-${i}"> ${message(code: 'default.button.replace.label', default: 'Replace file')}</a></p>
	                  		<p><a href="#modalDeleteDocument" role="button" class="btn btn-small btn-primary btnDel1" id="btnDel1-${i}"> ${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</a></p>
	                  	 </td>
					</tr>
				</g:each>
            </tbody>
		</table>
	</div>

<hr>
 <h5><g:message code="wish.secondStageRequiredDocuments.label" default="Second Stage Required Documents"/></h5>
    <div id="docPhases2" class="control-group fieldcontain ${hasErrors(bean: wishInstance, field: 'secondStageRequiredDocuments', 'error')} ">
 		<table class="table table-condensed table-hover">
 			<thead>
 				<tr>
 					<th>${message(code: 'wish.requiredDocumentation.label', default: 'Required documentation')}</th>
                   	<th>${message(code: 'document.courierRecord.label', default: 'Courier Record')}</th>
                   	<th>${message(code: 'document.received.label', default: 'Date received')}</th>
                  	<th>${message(code: 'document.deliveredToCustomsBrokerDate.label', default: 'Delivered to Customs Broker')}</th>
                  	<th>${message(code: 'document.deliveredToLawyerDate.label', default: 'Delivered to Lawyer')}</th>
                  	<th>${message(code: 'document.deliveredToCustomerDate.label', default: 'Delivered to Customer')}</th>

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

	                  	<td> <g:select class="input-medium" from="${DocumentsCourierRecord.list()}" optionKey="id" noSelection="['null': '']" name="courier" id="courier2-${i}"/> </td>

	                  	<td> <bs:datePicker name="documentDay" precision="day" default="none" noSelection="['': '']" id="date2-${i}"/> </td>
	                  	<td> <bs:datePicker name="deliveredToCustomsBrokerDate" precision="day" default="none" noSelection="['': '']" id="deliveredToCustomsBrokerDate2-${i}"/> </td>
	                  	<td> <bs:datePicker name="deliveredToLawyerDate" precision="day" default="none" noSelection="['': '']" id="deliveredToLawyerDate2-${i}"/> </td>
	                  	<td> <bs:datePicker name="deliveredToCustomerDate" precision="day" default="none" noSelection="['': '']" id="deliveredToCustomerDate2-${i}"/> </td>

	                  	<td>
	                  		<p><input type="file" id="btnAdd2-${i}" name="document"></p>
	                  		<p><a href="#modalReplaceDocument" role="button" class="btn btn-small btn-primary btnRep" id="btnRep2-${i}"> ${message(code: 'document.replacefile.label', default: 'Replace file')}</a></p>
	                  		<p><a href="#modalDeleteDocument" role="button" class="btn btn-small btn-primary btnDel2" id="btnDel2-${i}"> ${message(code: 'wish.deleteDocument.label', default: 'Delete document')}</a></p>
	                  	 </td>
					</tr>
				</g:each>
            </tbody>
 		</table>
    </div>

<!--  modal para reemplazar archivos de un documento -->
<g:render template="documentReplaceModal"></g:render>

<script type="text/javascript">

var nextUseDoc1 = 0, nextUseDoc2 = 0;

function checkName(nroDoc, nroId) {
	return "#check" + nroDoc + "-" + nroId;
};

function courierName(nroDoc, nroId) {
	return "#courier" + nroDoc + "-" + nroId;
};

function dateName(nroDoc, nroId) {
	return "#date" + nroDoc + "-" + nroId;
};

function deliveredToCustomsBrokerDateName(nroDoc, nroId) {
	return "#deliveredToCustomsBrokerDate" + nroDoc + "-" + nroId;
};

function deliveredToLawyerDateName(nroDoc, nroId) {
	return "#deliveredToLawyerDate" + nroDoc + "-" + nroId;
};

function deliveredToCustomerDateName(nroDoc, nroId) {
	return "#deliveredToCustomerDate" + nroDoc + "-" + nroId;
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

	var replaceNroDoc, replaceNroId, replaceIdButton;
	 
    var init = function(countElement, nroDoc)
    {
        var courier,date,btnAdd,btnDel,deliveredToCustomsBrokerDate,deliveredToLawyerDate,deliveredToCustomerDate;

        for(var i = 0; i < countElement; i++)
        {
            courier   = courierName(nroDoc, i);
            date   = dateName(nroDoc, i);
            deliveredToCustomsBrokerDate = deliveredToCustomsBrokerDateName(nroDoc, i);
            deliveredToLawyerDate = deliveredToLawyerDateName(nroDoc, i);
            deliveredToCustomerDate = deliveredToCustomerDateName(nroDoc, i);
            btnAdd = btnAddName(nroDoc, i);
            btnDel = btnDelName(nroDoc, i);
			btnRep = btnRepName(nroDoc, i);
			
			
            $(courier).prop("disabled", true);
            $(date).prop("disabled", true);
            $(deliveredToCustomsBrokerDate).prop("disabled", true);
            $(deliveredToLawyerDate).prop("disabled", true);
            $(deliveredToCustomerDate).prop("disabled", true);
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

    $(".btnRep").click(function()
    {	
    	replaceNroId = this.id.split("-")[1];
    	var aux = this.id.split("-")[0]; //primer parte del id
    	replaceNroDoc = aux.slice(6,aux.length); //6 = btnRep
    	
    	replaceIdButton = "#" + this.id;	

      	$("#modalReplaceDocument").modal('show');
    });    

    $("#repDoc").click(function()
   	{
    	var idAdd = btnAddName(replaceNroDoc, replaceNroId);
    	var idCheck = checkName(replaceNroDoc, replaceNroId);
    	var list = (replaceNroDoc == 1)? "firstStageRequiredDocuments": "secondStageRequiredDocuments";
    	var replacePosition = $(idCheck).attr("name").split("[")[1].split("]")[0];
    	
    	var nameAdd = list + "[" + replacePosition + "].file";
    
		var elementAdd = $("<p><input type='file' id='"+ idAdd +"' name='"+nameAdd+"'></p>");				

		$(replaceIdButton).parent().prepend(elementAdd);
    	
    	$(replaceIdButton).hide(); 
    });	

    $('td input.date').addClass('input-small');
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
    var	courier   = courierName(nroDoc, nroId);
    var	date   = dateName(nroDoc, nroId);
    var deliveredToCustomsBrokerDate = deliveredToCustomsBrokerDateName(nroDoc, nroId);
	var deliveredToLawyerDate = deliveredToLawyerDateName(nroDoc, nroId);
	var deliveredToCustomerDate = deliveredToCustomerDateName(nroDoc, nroId);
    var	btnAdd = btnAddName(nroDoc, nroId);
    var	btnDel = btnDelName(nroDoc, nroId);

    if ($(check).prop("checked") == true)
    {
        $(courier).prop("disabled", false);
        $(date).prop("disabled", false);
        $(deliveredToCustomsBrokerDate).prop("disabled", false);
        $(deliveredToLawyerDate).prop("disabled", false);
        $(deliveredToCustomerDate).prop("disabled", false);
        $(btnAdd).removeAttr("disabled");
        $(btnDel).removeAttr("disabled");
    }
    else
    {
        $(courier).prop("disabled", true);
        $(date).prop("disabled", true);
        $(deliveredToCustomsBrokerDate).prop("disabled", true);
        $(deliveredToLawyerDate).prop("disabled", true);
        $(deliveredToCustomerDate).prop("disabled", true);
        $(btnAdd).attr("disabled", "disabled");
        $(btnDel).attr("disabled", "disabled");
    }
};

function setName(elementCount, nroDoc, list)
{
    /* cambia los names para pasarle al controlador solo los que están marcados */
    for (var i = 0, id = (nroDoc==1)?nextUseDoc1:nextUseDoc2; i < elementCount; i++)
    {
        var	check  = "#check"  + nroDoc + "-" + i;
        var	courier   = "#courier"    + nroDoc + "-" + i;
        var	date   = "#date"   + nroDoc + "-" + i;
        var	deliveredToCustomsBrokerDate   = "#deliveredToCustomsBrokerDate"   + nroDoc + "-" + i;
        var	deliveredToLawyerDate   = "#deliveredToLawyerDate"   + nroDoc + "-" + i;
        var	deliveredToCustomerDate   = "#deliveredToCustomerDate"   + nroDoc + "-" + i;
        var	btnAdd = "#btnAdd" + nroDoc + "-" + i;
        var	btnDel = "#btnDel" + nroDoc + "-" + i;

        if ($(check).prop("disabled") == false)
        {
	         if ($(check).prop("checked") == true)
	         {
	            var checkName  = list + "[" + id + "].documentType.id";
	            var	courierName   = list + "[" + id + "].courierRecord.id";
	            var	dateName   = list + "[" + id + "].received";
	            var	deliveredToCustomsBrokerDateName   = list + "[" + id + "].deliveredToCustomsBrokerDate";
	            var	deliveredToLawyerDateName   = list + "[" + id + "].deliveredToLawyerDate";
	            var	deliveredToCustomerDateName   = list + "[" + id + "].deliveredToCustomerDate";
	            var	btnAddName = list + "[" + id + "].file";
	
	            $(check).attr("name", checkName);
	            $(courier).attr("name", courierName);
	            $(date).attr("name", dateName);
	            $(deliveredToCustomsBrokerDate).attr("name", deliveredToCustomsBrokerDateName);
	            $(deliveredToLawyerDate).attr("name", deliveredToLawyerDateName);
	            $(deliveredToCustomerDate).attr("name", deliveredToCustomerDateName);
	            $(btnAdd).attr("name", btnAddName);
	
	            id++;
	         }
	         else
	         {
	            $(check).removeAttr("name");
	            $(courier).removeAttr("name");
	            $(date).removeAttr("name");
	            $(deliveredToCustomsBrokerDate).removeAttr("name");
	            $(deliveredToLawyerDate).removeAttr("name");
	            $(deliveredToCustomerDate).removeAttr("name");
	            $(btnAdd).removeAttr("name");
	         }
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
	var idTypeDoc = ".checkDoc-" + numDoc + "[value = " + datos[0] + "]"; //busco el tipo de doc del pedido
    $(idTypeDoc).prop("checked", true); //marco el check si el doc esta en el pedido

    var nroId = $(idTypeDoc).attr("id").split("-")[1];

	clickFunc(nroId); //habilito los demás componentes
	
    var	courier   = "#courier"   + numDoc + "-" + nroId;
    var	date   = "#date"  + numDoc + "-" + nroId;
    var	deliveredToCustomsBrokerDate   = "#deliveredToCustomsBrokerDate"  + numDoc + "-" + nroId;
    var	deliveredToLawyerDate   = "#deliveredToLawyerDate"  + numDoc + "-" + nroId;
    var	deliveredToCustomerDate   = "#deliveredToCustomerDate"  + numDoc + "-" + nroId;
    var	btnAdd = "#btnAdd"+ numDoc + "-" + nroId;
    var	btnDel = "#btnDel"+ numDoc + "-" + nroId;
    var	btnRep = "#btnRep"+ numDoc + "-" + nroId;
    

    $(idTypeDoc).prop("disabled", true);
    $(courier).attr("value", datos[1]);
    $(date).attr("value", datos[2]);
    $(deliveredToCustomsBrokerDate).attr("value", datos[4]);
    $(deliveredToLawyerDate).attr("value", datos[5]);
    $(deliveredToCustomerDate).attr("value", datos[6]);

    $(btnDel).show();	

    if (datos[3] == true) // no hay archivo
    {
        $(btnAdd).show(); 
    }
    else // si hay archivo
    {
        $(btnAdd).parent().remove();
        $(btnRep).show();
    }	
};

	

</script>

<g:each var="doc1" in="${wishInstance?.firstStageRequiredDocuments}">
    <script type="text/javascript">
        $(document).ready(function() {

            var datos = ["${doc1?.documentType?.id}", "${doc1?.courierRecord?.id}", '${doc1?.received?.format("dd/MM/yyyy")}', "${doc1?.file?.length}" == "0",'${doc1?.deliveredToCustomsBrokerDate?.format("dd/MM/yyyy")}','${doc1?.deliveredToLawyerDate?.format("dd/MM/yyyy")}','${doc1?.deliveredToCustomerDate?.format("dd/MM/yyyy")}'];
            
            enableComponentCheck(1, datos, clickDocPhase1);      

            nextUseDoc1 ++;      
         });
    </script>
</g:each>

<g:each var="doc2" in="${wishInstance?.secondStageRequiredDocuments}">
    <script type="text/javascript">
        $(document).ready(function() {

        	var datos = ["${doc2?.documentType?.id}", "${doc2?.courierRecord?.id}", '${doc2?.received?.format("dd/MM/yyyy")}', "${doc2?.file?.length}" == "0",'${doc2?.deliveredToCustomsBrokerDate?.format("dd/MM/yyyy")}','${doc2?.deliveredToLawyerDate?.format("dd/MM/yyyy")}','${doc2?.deliveredToCustomerDate?.format("dd/MM/yyyy")}'];
        	
            enableComponentCheck(2, datos, clickDocPhase2);			

            nextUseDoc2 ++;
         });
    </script>
</g:each>