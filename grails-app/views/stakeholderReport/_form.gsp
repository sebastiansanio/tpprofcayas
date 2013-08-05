<%@ page import="report.StakeholderReport" %>
<%@ page import="wish.Wish" %>


	<div class="control-group fieldcontain ${hasErrors(bean: stakeholderReportInstance, field: 'name', 'error')} required">
		<label for="name" class="control-label"><g:message code="report.name.label" default="Name" /><span class="required-indicator">*</span></label>
		<div class="controls">
			<g:textField name="name" required="" value="${stakeholderReportInstance?.name}"/>
			<span class="help-inline">${hasErrors(bean: stakeholderReportInstance, field: 'name', 'error')}</span>
		</div>
	</div>

	<div class="row-fluid">
		<label class="span1" for="fields" class="control-label"><g:message code="report.fields.label" default="Fields" /></label>
		<div class="span4">									
			<g:select class="span12" size="13" id="avFields" name="avFields" from="${stakeholder.defaultReport.fields.findAll{!(it in reportInstance?.fields)}.sort{message(code:'wish.'+it+'.label')}}" optionValue="${{message(code:'wish.'+it+'.label')}}" multiple="multiple"/>
		</div>
		
		<div class="span2">	
			<div class="btn-group btn-group-vertical"  style="display:block;">
				<button type="button" class="btn" onClick="addFields();">${message(code:'add.label')} </button>
				<button type="button" class="btn" onClick="removeFields();"> ${message(code:'remove.label')} </button>
				<button type ="button" class="btn" onClick="up();"> ${message(code:'up.label')}</button>		
				<button type ="button" class="btn" onClick="down();"> ${message(code:'down.label')}</button>
			</div>
		</div>
	
		<div class="span4">			
			<g:select class="span12" onSubmit="selectAll();"size="13" id="fields" name="fields" from="${stakeholderReportInstance?.fields}" optionValue="${{message(code:'wish.'+it+'.label')}}" multiple="multiple" required=""/>
		</div>
	</div>
	
		
	<div class="control-group fieldcontain ${hasErrors(bean: stakeholderReportInstance, field: 'pendingOnly', 'error')} ">
		<label for="pendingOnly" class="control-label"><g:message code="report.pendingOnly.label" default="Pending Only" /></label>
		<div class="controls">
			<bs:checkBox name="pendingOnly" value="${stakeholderReportInstance?.pendingOnly}" />
			<span class="help-inline">${hasErrors(bean: stakeholderReportInstance, field: 'pendingOnly', 'error')}</span>
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
