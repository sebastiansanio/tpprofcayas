<%@ page import="wish.Wish" %>
<%@ page import="wish.Note" %>
<%@ page import="login.User" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>

<script type="text/javascript">

	var notesCount = ${wishInstance?.notes?.size()} + 0;

	function addNote(){
		var htmlId = "note" + notesCount;

		var templateHtml = "<div class='row' id='" + htmlId + "' name='" + htmlId +"'>";	

		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='text' class='control-label'>";
		templateHtml += "${message(code:'note.label')}:";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<textarea row='3' type='text' class='input-xxlarge' name='notes["+notesCount+"].text' />";
		templateHtml += "</div>";
		templateHtml += "</div>";

		templateHtml += "<input type='hidden' id='notes["+notesCount+"].user' name='notes["+notesCount+"].user.id' value='${User.findByUsername(SecurityUtils.subject.principal).id}'   />";

		templateHtml += "</div";
		
		$("#notesChildList").append(templateHtml);			
		notesCount++;
				
	}

	
</script>


<div id="notesChildList">
	
	<g:each var="noteInstance" in="${wishInstance?.notes}" status="i">
	
	
	<g:if test="{noteInstance.user.id == User.findByUsername(SecurityUtils.subject.principal).id}">
	<div class="row">
		
			
			
			<div class="control-group fieldcontain ${hasErrors(bean: noteInstance, field: 'text', 'error')} ">
				<label class='control-label'>
				<g:message code="note.label" default="Note" />
				(<g:formatDate value="noteInstance.dateCreated" />):
				</label>
				<div class="controls">
					<g:textArea class='input-xxlarge' rows='3' name="notes[${i}].text" >${noteInstance?.text}</g:textArea>
					<span class="help-inline">${hasErrors(bean: noteInstance, field: 'text', 'error')}</span>
					
					<g:link onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" class="btn btn-primary" action="deleteNote" id="${noteInstance.id}" params="[noteWishId: wishInstance.id]"><i class="icon-trash"></i></g:link>
				
				</div>
				
				
			</div>

			<g:hiddenField id="notes[${i}].user" name="notes[${i}].user.id" value="${noteInstance?.user?.id}"/>

	</div>
	</g:if>
	</g:each>
	
	
</div>


			


<input type="button" class="btn btn-primary" value="${message(code:'wish.notes.add', default:'Add note')}" onClick="addNote();" />
