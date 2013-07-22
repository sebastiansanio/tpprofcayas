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
				<g:select class="span12" onSubmit="selectAll();"size="13" id="fields" name="fields" from="${reportInstance?.fields}" optionValue="${{message(code:'wish.'+it+'.label')}}" multiple="multiple" required=""/>
			</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<div class="control-group">
			<label class="control-label" for="pendingOnly"><g:message code="report.pendingOnly.label" default="Pending Only" /></label>
			<div class="controls">
			<bs:checkBox name="pendingOnly" value="${reportInstance?.pendingOnly}" />
			</div>
			</div>
		</div>
		<div class="span5">	
			
			<g:hiddenField id="exportFormat" name="format" />
			<g:hiddenField id="exportExtension" name="extension" />
			
			<span><g:message code="export.label" default="Export" /></span>
			<g:actionSubmit onclick="\$('#exportFormat').val('csv');\$('#exportExtension').val('csv');" action="exportCurrent" value="CSV" />
			<g:actionSubmit onclick="\$('#exportFormat').val('excel');\$('#exportExtension').val('xls');" action="exportCurrent" value="EXCEL" />
			<g:actionSubmit onclick="\$('#exportFormat').val('ods');\$('#exportExtension').val('ods');" action="exportCurrent" value="ODS" />
			<g:actionSubmit onclick="\$('#exportFormat').val('pdf');\$('#exportExtension').val('pdf');" action="exportCurrent" value="PDF" />
		
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
