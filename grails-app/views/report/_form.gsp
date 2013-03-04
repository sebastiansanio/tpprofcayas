<%@ page import="report.Report" %>
<%@ page import="wish.Wish" %>



			<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="report.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${reportInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: reportInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reportInstance, field: 'fields', 'error')} ">
				<label for="fields" class="control-label"><g:message code="report.fields.label" default="Fields" /></label>
				<div class="controls">
															
					<g:select class="span4" size="15" id="avFields" name="avFields" from="${new Wish().domainClass.properties.findAll{!(it.name in reportInstance?.fields)}}" optionKey="name" optionValue="${{message(code:'wish.'+it.name+'.label')}}" multiple="multiple"/>
					
				
					<button type="button" onClick="addFields();">${message(code:'add.label')} </button>
					<button type="button" onClick="removeFields();">${message(code:'remove.label')} </button>
				
					<g:select onSubmit="selectAll();" class="span4" size="15" id="fields" name="fields" from="${reportInstance?.fields}" optionValue="${{message(code:'wish.'+it+'.label')}}" multiple="multiple"/>
																			
				
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

$('form').submit(function(){
		$("#fields option").attr('selected','selected');
	}
)

</script>
