<%@ page import="report.Report" %>
<%@ page import="wish.Wish" %>

	<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'name', 'error')} required">
		<label for="name" class="control-label"><g:message code="report.name.label" default="Name" /><span class="required-indicator">*</span></label>
		<div class="controls">
			<g:textField name="name" required="" value="${reportInstance?.name}"/>
			<span class="help-inline">${hasErrors(bean: reportInstance, field: 'name', 'error')}</span>
		</div>
	</div>

	<div class="row-fluid">
			<label class="span1" for="fields" class="control-label"><g:message code="report.fields.label" default="Fields" /></label>
			<div class="span4">									
				<g:select class="span12" size="13" id="avFields" name="avFields" from="${new Wish().domainClass.properties.findAll{!(it.name in reportInstance?.fields)}.sort{message(code:'wish.'+it.name+'.label')}}" optionKey="name" optionValue="${{message(code:'wish.'+it.name+'.label')}}" multiple="multiple"/>
			</div>
			<div class="span2">	
				<div class="row-fluid">
					<p><button class="span12" type="button" onClick="addFields();">${message(code:'add.label')} </button></p>
					<p><button class="span12" type="button" onClick="removeFields();"> ${message(code:'remove.label')} </button></p>
					<p><button class="span12" type ="button" onClick="up();"> ${message(code:'up.label')}</button>		</p>
					<p><button class="span12" type ="button" onClick="down();"> ${message(code:'down.label')}</button></p>
				</div>
			</div>
			<div class="span4">			
				<g:select class="span12" onSubmit="selectAll();"size="13" id="fields" name="fields" from="${reportInstance?.fields}" optionValue="${{message(code:'wish.'+it+'.label')}}" multiple="multiple"/>
			</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<label for="pendingOnly"><g:message code="report.pendingOnly.label" default="Pending Only" /></label>
			<bs:checkBox name="pendingOnly" value="${reportInstance?.pendingOnly}" />
		</div>
		<div class="span5">		
				<span><g:message code="export.label" default="Export" /></span>
				<button type="submit" formaction='../export?format=csv&amp;extension=csv' >
				<img src="${resource(dir: 'images/skin',file: 'csv.png')}"/> CSV
				</button>
				<button type="submit" formaction='../export?format=excel&amp;extension=xls' >
				<img src="${resource(dir: 'images/skin',file: 'excel.png')}"/> EXCEL
				</button>
				<button type="submit" formaction='../export?format=ods&amp;extension=ods' >
				<img src="${resource(dir: 'images/skin',file: 'ods.png')}"/> ODS
				</button>
				<button type="submit" formaction='../export?format=pdf&amp;extension=pdf' >
				<img src="${resource(dir: 'images/skin',file: 'pdf.png')}"/> PDF
				</button>
		</div>
	</div>
<script>
function addFields(){
	$("#avFields :selected").appendTo("#fields");
}

function removeFields(){
	$("#fields :selected").appendTo("#avFields");
}

function up(){
	var op = $("#fields :selected");
	if(op.length){
		op.first().prev().before(op)

	}
}

function down(){
	var op = $("#fields :selected");
	if(op.length){
		op.first().next().after(op)

	}
}

$('form').submit(function(){
		$("#fields option").attr('selected','selected');
	}
)

</script>
