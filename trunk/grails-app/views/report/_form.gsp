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
					<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'fields', 'error')} ">
						
					<label class="span1" for="fields" class="control-label"><g:message code="report.fields.label" default="Fields" /></label>
						
					<div class="span3">									
					<g:select size="15" id="avFields" name="avFields" from="${new Wish().domainClass.properties.findAll{!(it.name in reportInstance?.fields)}.sort{message(code:'wish.'+it.name+'.label')}}" optionKey="name" optionValue="${{message(code:'wish.'+it.name+'.label')}}" multiple="multiple"/>
					</div>
					
					<div class="span2">	
					<p><button class="span12" type="button" onClick="addFields();">${message(code:'add.label')} </button></p>
					<p><button class="span12" type="button" onClick="removeFields();"> ${message(code:'remove.label')} </button></p>
					<p><button class="span12" type ="button" onClick="up();"> ${message(code:'up.label')}</button>		</p>
					<p><button class="span12" type ="button" onClick="down();"> ${message(code:'down.label')}</button></p>
					</div>
					
					<div class="span3">			
					<g:select onSubmit="selectAll();"size="15" id="fields" name="fields" from="${reportInstance?.fields}" optionValue="${{message(code:'wish.'+it+'.label')}}" multiple="multiple"/>
					</div>
													
				
				</div>
				
					
				
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'pendingOnly', 'error')} ">
				<label for="pendingOnly" class="control-label"><g:message code="report.pendingOnly.label" default="Pending Only" /></label>
				<div class="controls">
					<bs:checkBox name="pendingOnly" value="${reportInstance?.pendingOnly}" />
					<span class="help-inline">${hasErrors(bean: reportInstance, field: 'pendingOnly', 'error')}</span>
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
