<%@ page import="report.ProductWishReport" %>
<%@ page import="wish.ProductWish" %>
<%@ page import="wish.ProductWishItem" %>
	<div class="control-group fieldcontain ${hasErrors(bean: productWishReportInstance, field: 'name', 'error')} required">
		<label for="name" class="control-label"><g:message code="productWishReport.name.label" /><span class="required-indicator">*</span></label>
		<div class="controls">
			<g:textField name="name" required="" value="${productWishReportInstance?.name}"/>
			<span class="help-inline">${hasErrors(bean: productWishReportInstance, field: 'name', 'error')}</span>
		</div>
	</div>

	<div class="row-fluid">
			<label class="span1" for="fields" class="control-label"><g:message code="report.fields.label" /></label>
			
			<div class="span4">									
				<g:select class="span12" size="13" id="avFields" name="avFields" from="${new ProductWishItem().domainClass.properties.findAll{!(it.name in productWishReportInstance?.fields)}.sort{message(code:'productWishItem.'+it.name+'.label')}}" optionKey="name" optionValue="${{message(code:'productWishItem.'+it.name+'.label')}}" multiple="multiple"/>
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
				<g:select class="span12" onSubmit="selectAll();"size="13" id="fields" name="fields" from="${productWishReportInstance?.fields}" optionValue="${{message(code:'productWishItem.'+it+'.label')}}" multiple="multiple" required=""/>
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

function selectAll(){
	$("#fields option").attr('selected','selected');
}

$('form').submit(function(){
		selectAll();
	}
)
</script>
